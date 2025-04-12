local menu = require "modules.menu.menu"

menu.helperFormat = {
  atScreenEdge = 0,
  radius = 0,
  textStyle = { font = { name = "Monaco", size = 14 } },
  strokeColor = { white = 0.95, alpha = 0.9 },
  fillColor = { white = 0.95, alpha = 0.9 },
  textColor = { white = 0, alpha = 1 },
}

local add = menu.add
local run = menu.run
local singleKey = menu.singleKey

add("Main Menu", {
  { -- Screenshot
    singleKey("s", "Screenshot"),
    function()
      run "Screenshot"
    end,
  },
  -- Dark Mode
  {
    singleKey("d", "Dark"),
    function()
      local output =
        hs.execute "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode'"
      if output == "true\n" then
        hs.execute "cp -f ~/dotfiles/config/alacritty/alacritty_light.toml ~/.config/alacritty/alacritty.toml"
      else
        hs.execute "cp -f ~/dotfiles/config/alacritty/alacritty_dark.toml ~/.config/alacritty/alacritty.toml"
      end

      if output == "true\n" then
        menu.color = {
          strokeColor = { white = 0.95, alpha = 1 },
          fillColor = { white = 0.95, alpha = 1 },
          textColor = { white = 0.5, alpha = 1 },
        }
      else
        menu.color = {
          strokeColor = { white = 0.05, alpha = 1 },
          fillColor = { white = 0.05, alpha = 1 },
          textColor = { white = 0.5, alpha = 1 },
        }
      end
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
    singleKey("l", "LaunchPad"),
    function()
      hs.keycodes.currentSourceID "com.apple.keylayout.ABC"
      hs.spaces.toggleLaunchPad()
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
    singleKey("t", "Trash"),
    function()
      hs.execute "open -a finder ~/.Trash"
    end,
  },
  -- Rimer Switcher
  {
    singleKey("r", "Rime"),
    function()
      hs.keycodes.currentSourceID "im.rime.inputmethod.Squirrel.Hans"
      hs.eventtap.keyStroke({ "control", "shift" }, "f4")
    end,
  },
  {
    singleKey("q", "Quit"),
    function() end,
  },
}, {
  helper = [[

     [l]: LaunchPad

     [d]: Dark

     [r]: Rime

     [s]: Screenshot

     [m]: Mission

     [o]: Setting

     [f]: Finder

     [t]: Trash

                         ]],

  helperFormat = {
    atScreenEdge = 0,
  },
})

add("Screenshot", {
  {
    singleKey("2", "Clipboard"),
    function()
      local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
      local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
      hs.task.new("/usr/sbin/screencapture", nil, { "-cio", fileName }):start()
    end,
  },
  {
    singleKey("3", "Screen"),
    function()
      local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
      local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
      hs.task.new("/usr/sbin/screencapture", nil, { fileName }):start()
    end,
  },
  {
    singleKey("4", "Area"),
    function()
      local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
      local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
      hs.task.new("/usr/sbin/screencapture", nil, { "-io", fileName }):start()
    end,
  },
  {
    singleKey("5", "App"),
    function()
      local timeStamp = string.gsub(os.date "%Y-%m-%d_%T", ":", ".")
      local fileName = os.getenv "HOME" .. "/Downloads/ss-" .. timeStamp .. ".png"
      local windowId = hs.window.frontmostWindow():id()
      hs.task.new("/usr/sbin/screencapture", nil, { "-l" .. windowId, fileName }):start()
    end,
  },
  {
    singleKey("q", "Quit"),
    function() end,
  },
})

add("Window", {
  {
    singleKey("o", "Maximize"),
    function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.99 }
    end,
    { keep = true },
  },
  {
    singleKey("f", "Float"),
    function()
      hs.window.focusedWindow():moveToUnit { 0.075, 0.075, 0.85, 0.85 }
    end,
    { keep = true },
  },
  {
    singleKey("k", "Up"),
    function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.4925 }
      -- hs.eventtap.keyStroke({ "control", "fn" }, "f")
    end,
    { keep = true },
  },
  {
    singleKey("j", "Down"),
    function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.5025, 0.99, 0.4925 }
    end,
    { keep = true },
  },
  {
    singleKey("h", "Left"),
    function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.4925, 0.99 }
    end,
    { keep = true },
  },
  {
    singleKey("l", "Right"),
    function()
      hs.window.focusedWindow():moveToUnit { 0.5025, 0.005, 0.4925, 0.99 }
    end,
    { keep = true },
  },
  {
    singleKey("t", "Top"),
    function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.93 }
    end,
  },
  {
    singleKey("q", "Quit"),
    function() end,
  },
}, {
  helper = [[

   [h]: Left   [o]: Max
   [j]: Down   [f]: Float
   [k]: Up     [t]: Top
   [l]: Right
                             ]],
  helperFormat = {
    atScreenEdge = 1,
    radius = 0,
    textStyle = { font = { name = "Monaco", size = 13 } },
  },
})

hs.hotkey.bind({ "alt" }, "w", function()
  run "Window"
end)

hs.hotkey.bind({ "alt" }, "a", function()
  run "Main Menu"
end)
