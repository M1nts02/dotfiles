--require "hs.ipc"

_G.utils = require "modules.utils" -- utils
_G.actions = require "modules.actions" -- actions

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
require "modules.launcher"
