-- require "hs.ipc"

_G.Utils = require "modules.utils" -- utils

-------------- Window ---------------
require "modules.window"

-------------- Menu -----------------
_G.Menu = hs.loadSpoon "Menu"
Menu.helperFormat = {
  atScreenEdge = 0,
  radius = 10,
  textStyle = { font = { name = "Monaco", size = 15 } },
}
require "modules.menu.main"
require "modules.menu.screenshot"

hs.hotkey.bind({}, "f18", function()
  hs.eventtap.keyStroke({ "fn" }, "c")
end)
