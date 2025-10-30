local menu = require "modules.menu.menu"

menu.helperFormat = {
  atScreenEdge = 0,
  radius = 0,
  textStyle = { font = { name = "Monaco", size = 14 } },
}

local add = menu.add
local run = menu.run
local singleKey = menu.singleKey
local terminal = "/Applications/Ghostty.app/Contents/MacOS/ghostty --window-decoration=none --background-opacity=0.85"

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
        menu.color = {
          strokeColor = { white = 0.95, alpha = 0.9 },
          fillColor = { white = 0.95, alpha = 0.9 },
          textColor = { white = 0.5, alpha = 1 },
        }
      else
        menu.color = {
          strokeColor = { white = 0.05, alpha = 0.9 },
          fillColor = { white = 0.05, alpha = 0.9 },
          textColor = { white = 0.5, alpha = 1 },
        }
      end
      hs.shortcuts.run "暗色模式"
    end,
  },
  {
    singleKey("e", "ScreenSaver"),
    function()
      hs.osascript.applescript 'tell application "ScreenSaverEngine" to run'
    end,
  },
  -- System Setting
  {
    singleKey("o", "SystemSetting"),
    function()
      hs.osascript.applescript [[tell application "System Preferences" to activate]]
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
  -- Ghostty
  {
    singleKey("g", "Ghostty"),
    function()
      hs.execute "open -a Ghostty -n"
    end,
  },
  -- Yazi
  {
    singleKey("y", "Yazi"),
    function()
      hs.execute("nohup " .. terminal .. " -e yazi > /tmp/yazi.log &", true)
    end,
  },
  -- Activity Monitor
  {
    singleKey("a", "Monitor"),
    function()
      hs.application.launchOrFocus "Activity Monitor"
    end,
  },
  -- Finder
  {
    singleKey("f", "Finder"),
    function()
      hs.application.launchOrFocus "Finder"
    end,
  },
  -- Safari
  {
    singleKey("b", "Safari"),
    function()
      hs.application.launchOrFocus "Safari"
    end,
  },
  -- Trash
  {
    singleKey("t", "Trash"),
    function()
      hs.osascript.applescript [[
tell application "Finder"
  open trash
  set the current view of the front Finder window to list view
  activate
end tell
]]
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

     [l]: LaunchPad       [f]: Finder

     [d]: Dark            [g]: Ghostty

     [e]: ScreenSaver     [y]: Yazi

     [r]: Rime            [s]: Screenshot

     [o]: Setting         [a]: Activity Monitor

     [b]: Safari          [m]: Mission

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

hs.hotkey.bind({ "alt" }, "a", function()
  run "Main Menu"
end)
