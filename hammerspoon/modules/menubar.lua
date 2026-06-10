hs.menuIcon(false)
_G.MenuBarItem = hs.menubar.new(true, "HammerspoonMenu")

local ss = require "actions.screenshot"
local sleep = require "actions.sleep"
local disk = require "actions.disk"
local trash = require "actions.trash"
local darkmode = require "actions.darkmode"
local screensaver = require "actions.screensaver"
local choose = require "actions.choose"
local audio = require "actions.audio"

local function buildMenu()
  local audioItems = {}
  for _, dev in ipairs(audio.get_audio_devices()) do
    table.insert(audioItems, {
      title = dev.name,
      checked = dev.current,
      fn = function()
        audio.set_audio_device(dev.name)
        hs.timer.doAfter(0.3, menubarRefresh)
      end,
    })
  end

  return {
    { title = "Reload Config", fn = hs.reload },
    { title = "Open Console", fn = hs.openConsole },
    { title = "-" },
    {
      title = "Window",
      menu = {
        { title = "Maximize", fn = Window.WindowMaximize },
        { title = "Center", fn = Window.WindowCenter },
        { title = "Left", fn = Window.WindowLeft },
        { title = "Right", fn = Window.WindowRight },
      },
    },
    {
      title = "Screenshot",
      menu = {
        { title = "Area", fn = function() ss.ScreenShot "Area" end },
        { title = "App", fn = function() ss.ScreenShot "App" end },
        { title = "Screen", fn = function() ss.ScreenShot "Screen" end },
        { title = "Clipboard", fn = function() ss.ScreenShot "Clipboard" end },
      },
    },
    { title = "Audio", menu = audioItems },
    { title = "-" },
    {
      title = "Dark Mode",
      checked = Utils.get_dark_mode(),
      fn = function()
        darkmode.toggle_dark_mode()
        hs.timer.doAfter(0.3, menubarRefresh)
      end,
    },
    {
      title = "Sleep Disabled",
      checked = sleep.get_sleep_disabled(),
      fn = function()
        sleep.toggle_sleep_disabled()
        hs.timer.doAfter(0.3, menubarRefresh)
      end,
    },
    { title = "ScreenSaver", fn = screensaver.toggle_screensaver },
    { title = "ZFinder", fn = choose.zfinder },
    { title = "Disk", fn = disk.show_disk_menu },
    { title = "Trash", fn = trash.open_trash },
  }
end

function menubarRefresh()
  if _G.MenuBarItem then
    _G.MenuBarItem:setTitle(require("actions.kaomoji").random())
    _G.MenuBarItem:setMenu(buildMenu)
  end
end

menubarRefresh()
