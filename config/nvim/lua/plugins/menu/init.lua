local confpath = vim.fn.stdpath "config"

return {
  name = "menu",
  dir = confpath,
  keys = {
    {
      "\\",
      function()
        require("plugins.menu.menu").open "Menu"
      end,
      { desc = "Menu" },
    },
  },
  config = require "plugins.menu.menus",
}
