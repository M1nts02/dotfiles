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
      desc = "Menu",
    },
    {
      "<Space>D",
      function()
        require("plugins.menu.menu").open "Dap"
      end,
      desc = "Debug",
    },
  },
  config = require "plugins.menu.menus",
}
