local menu = require "modules.menu.menu"
local add = menu.add
local run = menu.run
local singleKey = menu.singleKey

spaces = require "hs.spaces"

function MoveWindowToSpace(sp)
  local win = hs.window.focusedWindow() -- current window
  local cur_screen = hs.screen.mainScreen()
  local cur_screen_id = cur_screen:getUUID()
  local all_spaces = spaces.allSpaces()
  local spaceID = all_spaces[cur_screen_id][sp]
  spaces.moveWindowToSpace(win:id(), spaceID)
  spaces.gotoSpace(spaceID) -- follow window to new space
end

add("Window", {
  {
    singleKey("o", "Maximize"),
    function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.99 }
    end,
  },
  {
    singleKey("f", "Float"),
    function()
      hs.window.focusedWindow():moveToUnit { 0.075, 0.075, 0.85, 0.85 }
    end,
  },
  {
    singleKey("k", "Up"),
    function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.4925 }
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
    singleKey("1", "Move Space1"),
    function()
      MoveWindowToSpace(1)
    end,
  },
  {
    singleKey("2", "Move Space1"),
    function()
      MoveWindowToSpace(2)
    end,
  },
})

hs.hotkey.bind({ "alt" }, "w", function()
  run "Window"
end)
