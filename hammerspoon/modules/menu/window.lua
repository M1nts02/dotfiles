local menu = require "modules.menu.menu"

local add = menu.add
local run = menu.run
local singleKey = menu.singleKey

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
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.5, 0.6 }
    end,
    { keep = true },
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
    atScreenEdge = 0,
    radius = 0,
    textStyle = { font = { name = "Monaco", size = 13 } },
  },
})

hs.hotkey.bind({ "alt" }, "w", function()
  run "Window"
end)
