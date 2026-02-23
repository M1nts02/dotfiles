--require "hs.ipc"

--_G.DotPath = string.gsub(hs.execute 'cd "$( dirname "$( readlink "$HOME/.zshrc" )/" )" && pwd', "[\r\n]+$", "")
_G.Utils = require "modules.utils" -- utils
_G.Actions = require "modules.actions" -- actions

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

-------------- Launcher -------------
require "modules.launcher"
