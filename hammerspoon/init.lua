-- require "hs.ipc"

_G.Utils = require "modules.utils" -- utils

-------------- MintTab --------------
_G.MintTab = require "modules.minttab"

-------------- Window ---------------
_G.Window = require "actions.window"

-------------- Menu -----------------
_G.Menu = hs.loadSpoon "Menu"
Menu.helperFormat = {
  atScreenEdge = 0,
  radius = 10,
  textStyle = { font = { name = "Monaco", size = 15 } },
}
require "modules.menu.main"
require "modules.menu.screenshot"

-------------- Menubar --------------
require "modules.menubar"
