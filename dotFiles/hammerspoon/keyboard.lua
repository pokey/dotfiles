-- Adapted from https://github.com/jasonrudolph/keyboard/blob/214e628632a584d198ec1a43dfc88c4156977c51/hammerspoon/super.lua

require 'util'

local eventtap = hs.eventtap
local eventTypes = hs.eventtap.event.types

local log = hs.logger.new('simultaneous', 'debug')

keyUpDown = function(modifiers, key)
   eventtap.event.newKeyEvent(modifiers, key, true):post()
   eventtap.event.newKeyEvent(modifiers, key, false):post()
end

local MAX_TIME_BETWEEN_SIMULTANEOUS_KEY_PRESSES = 0.035 -- 35 milliseconds

local maps = {}
local ignores = {}
local currCombo = nil

simultaneousKeyDownListener = eventtap.new({eventTypes.keyDown}, function(event)
   local modifiers = getKeys(event:getFlags())
   local key = event:getCharacters()

   log.d("Got key", key, to_string(modifiers))

   -- We triggered this keypress, so don't try to interpret it as a combo
   if ignores[key] ~= nil then
      log.d("No fancy stuff for key", key, to_string(modifiers))
      ignores[key] = nil
      return false
   end

   -- We use this to indicate that the keypress needs to wait for a keypress we
   -- triggered
   local queue = false

   -- See if a combo has been starte
   if currCombo ~= nil then
      local fn = currCombo.map[key]
      local otherKey = currCombo.key 

      -- If we match the combo, then we don't want this keypress to go through
      local kill_event = false

      -- Is |key| a key that combo has been waiting for?
      if fn ~= nil then
         log.d("Executing combo", key, otherKey, to_string(modifiers))
         fn(modifiers)
         kill_event = true
      else
         -- If |key| is not what combo was waiting for, we kill the combo, and
         -- press the key that was waiting
         log.d("Combo was killed, pressing", otherKey, to_string(currCombo.modifiers),
               key)
         ignores[otherKey] = true
         keyUpDown(currCombo.modifiers, otherKey)

         -- Make sure that the waiting key is triggered before the current key
         queue = true
      end

      -- Whether or not we matched, we deactivate the combo
      currCombo.timer:stop()
      currCombo = nil

      -- If we matched, don't continue processing this event
      if kill_event then
         return true
      end
   end

   -- Is this |key| potentially part of a combo?
   local map = maps[key]
   if map ~= nil then
      -- Set timeout so that key will be pressed if no other keystroke is
      -- received in the necessary amount of time
      timer = hs.timer.doAfter(MAX_TIME_BETWEEN_SIMULTANEOUS_KEY_PRESSES,
                               function()
         log.d("Combo not found, pressing", key, to_string(modifiers))
         ignores[key] = true
         keyUpDown(modifiers, key)
         currCombo = nil
      end)

      currCombo = {
         timer = timer,
         map = map,
         key = key,
         modifiers = modifiers,
      }

      -- Don't let this keypress go through, as it may be initiating a combo
      return true
   end

   -- If we need to wait for a manually triggered event, we trigger this so
   -- that it happens after, and don't let the current event propagate
   if queue then
      keyUpDown(modifiers, key)
      return true
   end

   log.d("Finishing", key)
end):start()

function simultaneous(key1, key2, fn)
   get_table_default(maps, key1)[key2] = fn
   get_table_default(maps, key2)[key1] = fn
end

simultaneous('f', 'j', function(modifiers)
   keyUpDown(modifiers, hs.keycodes.map["return"])
end)
simultaneous('f', 'k', function()
   keyUpDown({"ctrl"}, hs.keycodes.map['h'])
end)
simultaneous('g', 'j', function()
   keyUpDown({"shift"}, hs.keycodes.map['\\'])
end)
simultaneous('v', 'j', function()
   keyUpDown({"ctrl"}, hs.keycodes.map['s'])
end)

log.d("Got key", key, to_string(modifiers))
