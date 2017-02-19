require "caffeine"
require "wifi"
require "keyboard"

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)

hs.alert.show("Config loaded")

hs.hotkey.bind({"cmd", "alt"}, "V", function()
    hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)
