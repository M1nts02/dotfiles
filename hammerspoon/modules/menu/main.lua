local menu = require "modules.menu.menu"
local utils = require "utils"
local actions = require "actions"

menu.helperFormat = {
  atScreenEdge = 0,
  radius = 10,
  textStyle = { font = { name = "Monaco", size = 15 } },
}

local add = menu.add
local run = menu.run
local singleKey = menu.singleKey

add("Main Menu", {
  -- Yazi
  {
    singleKey("v", "Vim"),
    function()
      actions["Nvim"]()
    end,
  },
  { -- Screenshot
    singleKey("s", "Screenshot"),
    function()
      run "Screenshot"
    end,
  },
  -- Ghostty
  {
    singleKey("2", "Ghostty"),
    function()
      hs.execute "open -a Ghostty -n"
    end,
  },
  -- Yazi
  {
    singleKey("y", "Yazi"),
    function()
      actions["Yazi"]()
    end,
  },
  -- Finder
  {
    singleKey("1", "Finder"),
    function()
      hs.application.launchOrFocus "Finder"
    end,
  },
  -- Rimer Switcher
  {
    singleKey("i", "Rime"),
    function()
      hs.keycodes.currentSourceID "im.rime.inputmethod.Squirrel.Hans"
      hs.eventtap.keyStroke({ "control", "shift" }, "f4")
    end,
  },
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
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.5, 0.6 }
    end,
    { keep = true },
  },
  {
    singleKey("f3", "Misson Control"),
    function()
      hs.spaces.openMissionControl()
    end,
  },
  {
    singleKey(";", "Volume Down"),
    function()
      local current = hs.audiodevice.defaultOutputDevice():volume()
      local newVolume = math.min(current - 5, 100)
      hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
    end,
    { keep = true },
  },
  {
    singleKey("'", "Volume Up"),
    function()
      local current = hs.audiodevice.defaultOutputDevice():volume()
      local newVolume = math.min(current + 5, 100)
      hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
    end,
    { keep = true },
  },
  {
    singleKey("0", "Mute Toggle"),
    function()
      local device = hs.audiodevice.defaultOutputDevice()
      local muted = device:muted()
      device:setMuted(not muted)
    end,
    { keep = true },
  },
  {
    singleKey("f11", "Volume Down"),
    function()
      local current = hs.audiodevice.defaultOutputDevice():volume()
      local newVolume = math.min(current - 5, 100)
      hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
    end,
    { keep = true },
  },
  {
    singleKey("f12", "Volume Up"),
    function()
      local current = hs.audiodevice.defaultOutputDevice():volume()
      local newVolume = math.min(current + 5, 100)
      hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
    end,
    { keep = true },
  },
  {
    singleKey("f10", "Mute Toggle"),
    function()
      local device = hs.audiodevice.defaultOutputDevice()
      local muted = device:muted()
      device:setMuted(not muted)
    end,
    { keep = true },
  },
  {
    singleKey("]", "Next"),
    function()
      hs.eventtap.event.newSystemKeyEvent("NEXT", true):post()
      hs.eventtap.event.newSystemKeyEvent("NEXT", false):post()
    end,
    { keep = true },
  },
  {
    singleKey("[", "Previous"),
    function()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", true):post()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", false):post()
    end,
    { keep = true },
  },
  {
    singleKey("p", "Play"),
    function()
      hs.eventtap.event.newSystemKeyEvent("PLAY", true):post()
      hs.eventtap.event.newSystemKeyEvent("PLAY", false):post()
    end,
    { keep = true },
  },
  {
    singleKey("f9", "Next"),
    function()
      hs.eventtap.event.newSystemKeyEvent("NEXT", true):post()
      hs.eventtap.event.newSystemKeyEvent("NEXT", false):post()
    end,
    { keep = true },
  },
  {
    singleKey("f7", "Prev"),
    function()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", true):post()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", false):post()
    end,
    { keep = true },
  },
  {
    singleKey("f8", "Play"),
    function()
      hs.eventtap.event.newSystemKeyEvent("PLAY", true):post()
      hs.eventtap.event.newSystemKeyEvent("PLAY", false):post()
    end,
    { keep = true },
  },
  {
    singleKey("r", "Reload"),
    function()
      hs.reload()
      hs.notify.new():title("Reload"):subTitle("Hammerspoon reload done!"):send()
    end,
  },
  {
    singleKey("q", "Quit"),
    function() end,
  },
}, {
  helper = [[

     [1]: Finder          [2]: Ghostty

     [s]: Screenshot      [i]: Rime

     [v]: Vim             [y]: Yazi

     [o]: Window Max      [f]: Window Float

     [h]: Window Left     [l]: Window Right

     [k]: Window Up       [j]: Window Down

     [t]: Window Top      [r]: Reload

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
      hs.notify.new():title("Screenshot"):subTitle(fileName):send()
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
      hs.notify.new():title("Screenshot"):subTitle(fileName):send()
    end,
  },
  {
    singleKey("q", "Quit"),
    function() end,
  },
})

hs.hotkey.bind({ "cmd" }, "`", function()
  menu.color = utils.get_helper_color()
  run "Main Menu"
end)
