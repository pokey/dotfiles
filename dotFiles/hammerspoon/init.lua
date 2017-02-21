require "caffeine"
require "wifi"
require "keyboard"

local log = hs.logger.new('init', 'debug')

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)

hs.hotkey.bind({"cmd", "alt"}, "V", function()
    hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

hs.alert.show("Config loaded")
log.d("Init hello.")
