local menu = require "modules.menu.menu"
local add = menu.add
local run = menu.run
local singleKey = menu.singleKey

local helper = [[

   [s]: Screenshot [o]: Setting  [m]: Mission
   [f]: Finder     [h]: Trash    [d]: Dark
   [e]: LaunchPad
                                                ]]

add("Main Menu", {
  { -- Screenshot
    singleKey("s", "Screenshot"),
    function()
      run "Screenshot"
    end,
  },
  -- Finder
  {
    singleKey("f", "Finder"),
    function()
      hs.application.launchOrFocus "Finder"
    end,
  },

  -- Trash
  {
    singleKey("h", "Trash"),
    function()
      hs.execute "open -a finder ~/.Trash"
    end,
  },
  -- Dark Mode
  {
    singleKey("d", "Dark"),
    function()
      hs.shortcuts.run "暗色模式"
    end,
  },
  -- System Setting
  {
    singleKey("o", "SystemSetting"),
    function()
      hs.execute "open -b com.apple.systempreferences /System/Library/PreferencePanes"
    end,
  },
  -- Mission Control
  {
    singleKey("m", "MissionControl"),
    function()
      hs.spaces.openMissionControl()
    end,
  },
  {
    singleKey("e", "LaunchPad"),
    function()
      hs.keycodes.currentSourceID "com.apple.keylayout.ABC"
      hs.spaces.toggleLaunchPad()
    end,
  },
  {
    singleKey("q", "Quit"),
    function() end,
  },
}, {
  helper = helper,
})

hs.hotkey.bind({ "alt" }, "space", function()
  run "Main Menu"
end)
