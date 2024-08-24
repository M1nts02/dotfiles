local menu = require "modules.menu.menu"
local add = menu.add
local run = menu.run
local singleKey = menu.singleKey

local helper = [[
 ---------- Action ----------   --- Media ---
 SPC: Launch    a: Apps         \: Play
 d:   Dock      w: Window       ]: Next
 m:   Mission   4: Screenshot   [: Previous

 ------- Input Method -------   ------ Control ------
 1: ABC   e: Emoji              9: ✸-  -: ⁌-  BS: ⁌x
 2: Rime  3: Switcher           0: ✸+  =: ⁌+          ]]

add("Main Menu", {
  { -- ABC
    singleKey("1", "English"),
    function()
      hs.keycodes.currentSourceID "com.apple.keylayout.ABC"
    end,
  },
  { -- Rime
    singleKey("2", "Rime"),
    function()
      hs.keycodes.currentSourceID "im.rime.inputmethod.Squirrel.Hans"
    end,
  },
  { -- Rime Switcher
    singleKey("3", "Rime Switcher"),
    function()
      hs.eventtap.keyStroke({ "control", "shift" }, "f4")
    end,
  },
  { -- LaunchPad
    singleKey("space", "LaunchPad"),
    function()
      hs.spaces.toggleLaunchPad()
    end,
  },
  { -- Mission Control
    singleKey("m", "Mission"),
    function()
      hs.spaces.toggleMissionControl()
    end,
  },
  { -- Dock
    singleKey("d", "Dock"),
    function()
      hs.eventtap.keyStroke({ "fn" }, "a")
    end,
  },
  -- Emoji
  {
    singleKey("e", "Emoji"),
    function()
      hs.eventtap.keyStroke({ "fn" }, "e")
    end,
  },
  { -- Applications
    singleKey("a", "Applications"),
    function()
      run "Applications"
    end,
  },
  { -- Window
    singleKey("w", "Window"),
    function()
      run "Window"
    end,
  },
  { -- Screenshot
    singleKey("4", "Screenshot"),
    function()
      run "Screenshot"
    end,
  },

  { -- Next Song
    singleKey("]", "Next"),
    function()
      hs.eventtap.event.newSystemKeyEvent("NEXT", true):post()
      hs.eventtap.event.newSystemKeyEvent("NEXT", false):post()
    end,
    { keep = true },
  },
  { -- Previous Song
    singleKey("[", "Previous"),
    function()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", true):post()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", false):post()
    end,
    { keep = true },
  },
  { -- Play
    singleKey("\\", "Play"),
    function()
      hs.eventtap.event.newSystemKeyEvent("PLAY", true):post()
      hs.eventtap.event.newSystemKeyEvent("PLAY", false):post()
    end,
    { keep = true },
  },

  { -- Sound+
    singleKey("=", "Sound+"),
    function()
      hs.eventtap.event.newSystemKeyEvent("SOUND_UP", true):post()
      hs.eventtap.event.newSystemKeyEvent("SOUND_UP", false):post()
    end,
    { keep = true },
  },
  { -- Sound-
    singleKey("-", "Sound-"),
    function()
      hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", true):post()
      hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", false):post()
    end,
    { keep = true },
  },
  { -- Mute
    singleKey("delete", "Mute"),
    function()
      hs.eventtap.event.newSystemKeyEvent("MUTE", true):post()
      hs.eventtap.event.newSystemKeyEvent("MUTE", false):post()
    end,
    { keep = true },
  },

  { -- Brightness+
    singleKey("0", "Brightness+"),
    function()
      hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_UP", true):post()
      hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_UP", false):post()
    end,
    { keep = true },
  },
  { -- Brightness-
    singleKey("9", "Brightness-"),
    function()
      hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_DOWN", true):post()
      hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_DOWN", false):post()
    end,
    { keep = true },
  },
}, {
  helper = helper,
})

hs.hotkey.bind({ "command" }, "space", function()
  run "Main Menu"
end)
