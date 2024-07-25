local confpath = vim.fn.stdpath "config"

return {
  "M1nts02/simplemenu.nvim",
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
