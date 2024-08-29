local menu = require "modules.menu.menu"
local add = menu.add
local run = menu.run
local singleKey = menu.singleKey

add("Applications", {
  -- Terminal
  {
    singleKey("t", "Terminal"),
    function()
      hs.application.launchOrFocus "Wezterm"
    end,
  },

  -- Browser
  {
    singleKey("w", "Web Browser"),
    function()
      hs.application.launchOrFocus "Zen Browser"
    end,
  },

  -- Finder
  {
    singleKey("f", "Finder"),
    function()
      hs.application.launchOrFocus "Finder"
    end,
  },

  -- Tools
  {
    singleKey("m", "DarkMode"),
    function()
      hs.shortcuts.run "切换黑暗模式"
    end,
  },
})
