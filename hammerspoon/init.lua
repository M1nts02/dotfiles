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
for i, v in pairs(actions) do
  if v.pass == true then
    goto continue
  end

  if v.image == nil then
    v.image = hs.image.imageFromPath "icons/grid-home-menu-options-squares-table.ico"
  end
  Launcher.actions[i] = {
    run = v.run,
    subText = v.subText,
    image = v.image,
  }

  ::continue::
end
Launcher.preAction = function(item)
  if item.type ~= "App" then
    return
  end
  if utils.flashSpaceRunning() then
    local current_space = utils.flashSpaceGetWorkspace()
    local bundleID = utils.getBundleId(item.path)

    if not hs.application.get(bundleID) then
      utils.flashSpaceMoveSpace { bundleID = bundleID, spaceName = current_space }
    end
  end
end
Launcher.start()
hs.hotkey.bind({ "cmd" }, "space", function()
  Launcher.bgDark = utils.get_dark_mode()
  Launcher.open()
end)
