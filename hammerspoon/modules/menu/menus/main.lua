local menu = require "modules.menu.menu"
local add = menu.add
local run = menu.run
local singleKey = menu.singleKey

local helper = [[

 [SPC]: Actions       [s]: Screenshot
 [1]: ABC    [2]: Rime  [3]: Switcher
 [⏎]: Play   [']: Next  [;]: Previous
                                      ]]

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
  { -- Actions
    singleKey("space", "Actions"),
    function()
      run "Actions"
    end,
  },
  { -- Screenshot
    singleKey("s", "Screenshot"),
    function()
      run "Screenshot"
    end,
  },

  { -- Next Song
    singleKey("'", "Next"),
    function()
      hs.eventtap.event.newSystemKeyEvent("NEXT", true):post()
      hs.eventtap.event.newSystemKeyEvent("NEXT", false):post()
    end,
    { keep = true },
  },
  { -- Previous Song
    singleKey(";", "Previous"),
    function()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", true):post()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", false):post()
    end,
    { keep = true },
  },
  { -- Play
    singleKey("return", "Play"),
    function()
      hs.eventtap.event.newSystemKeyEvent("PLAY", true):post()
      hs.eventtap.event.newSystemKeyEvent("PLAY", false):post()
    end,
    { keep = true },
  },
}, {
  helper = helper,
})

hs.hotkey.bind({ "alt" }, "space", function()
  run "Main Menu"
end)
