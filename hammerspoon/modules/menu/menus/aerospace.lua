local menu = require "modules.menu.menu"
local add = menu.add
local run = menu.run
local singleKey = menu.singleKey

local aerospace = "/opt/homebrew/bin/aerospace"

local helper = [[
  ---- Action ----
  f: Float
  o: Fullscreen
 ]]

add("Aerospace", {
  {
    singleKey("o", "Fullscreen"),
    function()
      hs.execute(aerospace .. " fullscreen")
    end,
  },
  {
    singleKey("f", "Float"),
    function()
      hs.execute(aerospace .. " layout floating tiling")
    end,
  },
  {
    singleKey("1", "Workspace 1"),
    function()
      hs.execute(aerospace .. " move-node-to-workspace 1")
      hs.execute(aerospace .. " workspace 1")
    end,
  },
  {
    singleKey("2", "Workspace 2"),
    function()
      hs.execute(aerospace .. " move-node-to-workspace 2")
      hs.execute(aerospace .. " workspace 2")
    end,
  },
  {
    singleKey("3", "Workspace 3"),
    function()
      hs.execute(aerospace .. " move-node-to-workspace 3")
      hs.execute(aerospace .. " workspace 3")
    end,
  },
  {
    singleKey("4", "Workspace 4"),
    function()
      hs.execute(aerospace .. " move-node-to-workspace 4")
      hs.execute(aerospace .. " workspace 4")
    end,
  },
  {
    singleKey("5", "Workspace 5"),
    function()
      hs.execute(aerospace .. " move-node-to-workspace 5")
      hs.execute(aerospace .. " workspace 5")
    end,
  },
  {
    singleKey("6", "Workspace 6"),
    function()
      hs.execute(aerospace .. " move-node-to-workspace 6")
      hs.execute(aerospace .. " workspace 6")
    end,
  },
  {
    singleKey("7", "Workspace 7"),
    function()
      hs.execute(aerospace .. " move-node-to-workspace 7")
      hs.execute(aerospace .. " workspace 7")
    end,
  },
  {
    singleKey("8", "Workspace 8"),
    function()
      hs.execute(aerospace .. " move-node-to-workspace 8")
      hs.execute(aerospace .. " workspace 8")
    end,
  },
  {
    singleKey("9", "Workspace 9"),
    function()
      hs.execute(aerospace .. " move-node-to-workspace 9")
      hs.execute(aerospace .. " workspace 9")
    end,
  },
}, {
  helper = helper,
})
