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

-------------- Launcher -------------
Launcher = hs.loadSpoon "Launcher"
Launcher.actions = actions
Launcher.preAction = function(item)
  if item.type ~= "App" then
    return
  end
  if utils.flashSpaceRunning() then
    local current_space = utils.flashSpaceGetWorkspace()
    local bundleID = utils.getBundleId(item.path)

    if not hs.application.get(bundleID) then
      utils.flashSpaceMoveSpace(bundleID, current_space)
    end
  end
end

hs.hotkey.bind({ "cmd" }, "space", function()
  Launcher.bgDark = utils.get_dark_mode()
  Launcher.run()
end)
