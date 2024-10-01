local menu = require "modules.menu.menu"
local add = menu.add
local run = menu.run
local singleKey = menu.singleKey

add("Actions", {
  -- Finder
  {
    singleKey("f", "Finder"),
    function()
      hs.application.launchOrFocus "Finder"
    end,
  },

  -- Trash
  {
    singleKey("h", "Trash"),
    function()
      hs.execute "open -a finder ~/.Trash"
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
