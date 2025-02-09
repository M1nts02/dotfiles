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
    singleKey("space", "LaunchPad"),
    function()
      hs.keycodes.currentSourceID "com.apple.keylayout.ABC"
      hs.spaces.toggleLaunchPad()
    end,
  },
  -- Finder
  {
    singleKey("1", "Finder"),
    function()
      hs.application.launchOrFocus "Finder"
    end,
  },
  -- Ghosty
  {
    singleKey("2", "Ghostty"),
    function()
      hs.application.launchOrFocus "Ghostty"
    end,
  },
  -- Cantata
  {
    singleKey("3", "Cantat"),
    function()
      hs.application.launchOrFocus "Cantata"
    end,
  },
  -- MacVim
  {
    singleKey("4", "MacVim"),
    function()
      hs.application.launchOrFocus "MacVim"
    end,
  },
  -- App Store
  {
    singleKey("5", "App Store"),
    function()
      hs.application.launchOrFocus "App Store"
    end,
  },
  -- Note
  {
    singleKey("6", "Notes"),
    function()
      hs.application.launchOrFocus "Notes"
    end,
  },
  -- Reminders
  {
    singleKey("7", "Reminders"),
    function()
      hs.application.launchOrFocus "Reminders"
    end,
  },
  -- Trash
  {
    singleKey("8", "Trash"),
    function()
      hs.execute "open -a finder ~/.Trash"
    end,
  },
  -- Safari
  {
    singleKey("9", "Safari"),
    function()
      hs.application.launchOrFocus "Safari"
    end,
  },
  -- Zen Browser
  {
    singleKey("0", "Zen Browser"),
    function()
      hs.application.launchOrFocus "Zen Browser"
    end,
  },
  {
    singleKey("q", "Quit"),
    function() end,
  },
}, {
  helper = [[


     [SPC]: LaunchPad                                              [1]: Finder

     [d]: Dark                                                     [2]: Ghostty

     [s]: Screenshot                                               [3]: Cantata

     [m]: Mission                                                  [4]: MacVim

     [o]: Setting                                                  [5]: App store

                                                                   [6]: Notes

                                                                   [7]: Reminders

                                                                   [8]: Trash

                                                                   [9]: Safari

                                                                   [0]: Zen Browser


                                                                                            ]],

  helperFormat = {
    atScreenEdge = 0,
  },
})

add("Mpd", {
  {
    singleKey("space", "Toggle"),
    function()
      hs.execute("mpc toggle", true)
    end,
    { keep = true },
  },
  {
    singleKey("]", "Next"),
    function()
      local result = hs.execute("mpc next", true)
      local i = string.find(result, "\n")
      local r = string.sub(result, 1, i)
      hs.notify.show("Mpd Next", "", r)
    end,
    { keep = true },
  },
  {
    singleKey("[", "Prev"),
    function()
      local result = hs.execute("mpc prev", true)
      local i = string.find(result, "\n")
      local r = string.sub(result, 1, i)
      hs.notify.show("Mpd Prev", "", r)
    end,
    { keep = true },
  },
  {
    singleKey("d", "Next"),
    function()
      local result = hs.execute("mpc next", true)
      local i = string.find(result, "\n")
      local r = string.sub(result, 1, i)
      hs.notify.show("Mpd Next", "", r)
    end,
    { keep = true },
  },
  {
    singleKey("a", "Prev"),
    function()
      local result = hs.execute("mpc prev", true)
      local i = string.find(result, "\n")
      local r = string.sub(result, 1, i)
      hs.notify.show("Mpd Prev", "", r)
    end,
    { keep = true },
  },
  {
    singleKey("=", "Volume+"),
    function()
      hs.execute("mpc volume +5", true)
    end,
    { keep = true },
  },
  {
    singleKey("-", "Volume-"),
    function()
      hs.execute("mpc volume -5", true)
    end,
    { keep = true },
  },
  {
    singleKey("s", "Stop"),
    function()
      hs.execute("mpc stop", true)
    end,
    { keep = true },
  },
  {
    singleKey("o", "Status"),
    function()
      local result = hs.execute("mpc status", true)
      hs.notify.show("Mpd", "", result)
    end,
    { keep = true },
  },
  {
    singleKey(".", "Random"),
    function()
      local result = hs.execute("mpc random", true)
      local r = string.find(result, "random: on") == nil and "Random: Off" or "Random: On"
      hs.notify.show("Mpd", "", r)
    end,
    { keep = true },
  },
  {
    singleKey(",", "Single"),
    function()
      local result = hs.execute("mpc single", true)
      local r = string.find(result, "single: on") == nil and "Single: Off" or "Single: On"
      hs.notify.show("Mpd", "", r)
    end,
    { keep = true },
  },
  {
    singleKey("l", "Repeat"),
    function()
      local result = hs.execute("mpc repeat", true)
      local r = string.find(result, "repeat: on") == nil and "Repeat: Off" or "Repeat: On"
      hs.notify.show("Mpd", "", r)
    end,
    { keep = true },
  },
  {
    singleKey("u", "Update"),
    function()
      hs.execute("mpc update", true)
    end,
    { keep = true },
  },
  {
    singleKey("r", "Restart"),
    function()
      hs.execute("brew services restart mpd", true)
    end,
    { keep = true },
  },
  {
    singleKey("q", "Quit"),
    function() end,
  },
}, {
  helper = [[

   [,]: Single [.]: Random  [l]: Repeat
   [a]: Prev   [d]: Next    [s]: Stop
   [u]: Update [r]: Restart [o]: Statuc
                                         ]],
  helperFormat = {
    atScreenEdge = 1,
    radius = 0,
    textStyle = { font = { name = "Monaco", size = 13 } },
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

hs.hotkey.bind({ "alt" }, "d", function()
  run "Mpd"
end)

hs.hotkey.bind({ "alt" }, "space", function()
  run "Main Menu"
end)
