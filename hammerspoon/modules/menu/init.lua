local menu = require "modules.menu.menu"

menu.helperFormat = {
  atScreenEdge = 0,
  radius = 10,
  textStyle = { font = { name = "Monaco", size = 16 } },
}

require "modules.menu.menus.main"
require "modules.menu.menus.applications"
-- require "modules.menu.menus.window"
require "modules.menu.menus.aerospace"
require "modules.menu.menus.screenshot"
