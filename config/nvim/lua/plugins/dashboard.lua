local utils = require "modules.utils"
local executable = utils.executable

local custom_header = {
  "⠀⠀⣸⣿⣿⣿⡏⠀⡀⠀⠀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠘⡇⠀⢷⠀⠀⠀⠀⠀⠀⠀⠈⡅⠀⠀⢀⠀⠀⠀⠘⡆⠀⠀",
  "⠀⠀⣿⣿⣿⡟⠀⢀⡇⠀⢠⡏⣀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⣁⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⢱⠀⠀⠀⠆⠀⠀⠀⢳⠀⠀",
  "⠀⠀⣿⣿⣿⠃⠀⠘⠃⠀⢸⡇⠛⠀⠀⠀⠀⠀⠀⠀⢀⡏⢀⠀⠀⠀⠀⠀⢉⠀⠈⠀⠀⠀⠄⠀⢸⠀⠀⠀⡆⠀⠀⠟⠀⠀⠀⠸⠀⠀",
  "⠀⢸⣿⣿⡟⠀⠀⣸⠀⠀⣾⠃⡇⠀⠀⠀⠀⠀⣀⠀⢰⡇⢸⡇⠀⠸⢂⠀⠸⡀⠀⡇⠀⠀⣴⠀⠀⡄⠀⠀⣦⠀⠀⠸⠀⠀⠀⠀⠇⠀",
  "⠀⢼⣿⣿⠇⣆⣠⣿⠤⣾⣿⣀⠁⢠⡄⠀⠀⠀⡿⠀⣼⡇⢸⡇⠀⠀⣿⡄⠀⡇⠀⡇⠀⠀⣿⠀⠀⡄⠀⠀⢉⠀⠀⠀⡇⠀⠀⠀⢰⠀",
  "⠀⢸⣿⣿⢹⡏⣿⢿⢀⣿⣿⢸⠀⢸⣇⢀⠀⠀⣾⢟⣿⣿⢻⣷⣤⣀⢡⠧⠀⡇⠀⡇⠀⠀⣿⠀⠀⣇⠀⠀⢸⠀⠀⠀⢀⠀⠀⠀⠘⠀",
  "⠀⣾⣿⢸⣼⣿⢇⠈⣼⣿⠘⣸⣿⠸⣿⡈⠀⠀⣿⣸⠏⠘⡺⣿⡘⡏⠻⢼⡄⠁⠀⡇⠀⠀⣿⠀⢠⣿⠀⠀⠘⠄⢀⠀⢸⠀⠀⢠⢰⡇",
  "⠀⣿⣿⠘⢱⣽⣿⢿⣿⣮⡣⢽⢠⠀⣿⣇⢀⡀⣿⠏⣠⣐⣻⣿⢧⢿⣸⣇⣇⠀⠀⡇⠀⠀⣿⠀⢸⣿⠀⠀⠀⡇⢠⠀⢸⠀⠀⢠⠀⠅",
  "⠀⣿⣿⣴⠈⠋⠀⢀⣀⢹⣿⡾⢷⢣⣻⢸⡸⣧⢋⠀⠉⣽⣾⣿⣷⣧⢺⠓⣿⡀⣀⠁⠀⠀⠉⠀⢸⣿⠀⠀⠀⡇⢸⠀⢠⠀⠀⢸⡇⡇",
  "⠀⣿⣿⣿⡆⠀⠀⠘⣿⢿⣿⡇⠀⠁⠉⠋⠀⠀⠁⠃⠀⠀⠀⡌⠉⢻⣿⣷⣍⢻⣹⠀⠀⠀⡇⠀⣿⣿⣄⡀⠀⡇⢸⠀⢸⡇⠀⢸⡇⡇",
  "⠀⣿⣿⣿⣿⠀⠀⠀⠙⢦⠼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣿⣿⡿⠻⢆⣿⠀⠀⠀⠇⢀⣋⣭⣤⢱⠀⡇⠀⠀⣸⡇⠀⢸⡇⠙",
  "⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣆⣩⡿⠃⠀⠀⡿⠀⠀⢠⠀⢸⣿⣿⡿⢹⠀⠃⠀⣆⣻⠇⠀⢸⡇⠀",
  "⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⡍⠀⢸⠀⢸⣿⣿⢀⡎⢰⠀⠀⣿⣿⠀⠀⣿⡇⠀",
  "⠀⢿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣇⠃⠀⡈⢀⣿⡿⣷⠋⠀⣸⠀⠀⣿⣿⠆⠀⣿⡇⠀",
  "⠀⢸⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡘⠀⠀⠇⣈⣩⣾⣿⠀⠀⣿⠀⢰⣿⣿⠀⢰⣟⠁⠄",
  "⠀⢸⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠠  ⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣈⡃⠀⠀⠀⣿⣿⣿⣿⠀⠀⣿⠀⢸⣿⣿⠀⣾⢹⠀⡀",
  "⠀⢸⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⠃⠀⠀⢰⣿⣿⣿⡏⠀⣸⡇⠀⣿⣿⡟⢰⠇⠸⢀⠀",
  "⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⣿⡇⠀⣀⢀⣿⣿⣿⣿⠁⢀⣿⠁⢸⣿⣿⣇⠂⠀⣄⠌⠀",
  "⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⣀⣀⣠⣤⣶⣿⣿⣿⣿⣿⣿⣿⠁⢠⡇⣸⣿⣿⣿⡇⠀⣸⡇⢀⣾⣿⡿⠊⠀⣐⡾⠀⠀",
  "⠀⠀⢻⣯⢿⣿⣿⣿⣿⠹⣿⡟⣿⡿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⢠⣿⣼⣿⣿⣿⡟⠁⠌⡽⠁⣽⡿⣽⠃⠀⠠⠋⠀⠀⠀",
  "⠀⠀⠀⢻⡀⠻⣿⣇⠻⠆⠀⠛⠈⠁⠈⠁⠘⠋⠈⢿⣿⣿⣿⣿⣿⣿⣿⠏⣠⣾⣷⣿⣿⡇⠾⠐⠠⠖⢈⠴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  "",
  "",
}

local opts = {
  theme = "doom",
  config = {
    header = custom_header,
    center = {
      {
        desc = "Plugin Manager",
        desc_hl = "Keyword",
        action = "Lazy",
        key = "p",
      },
      {
        desc = "LSP and Debuger",
        desc_hl = "Question",
        action = "Mason",
        key = "m",
      },
      {
        desc = "File Browser",
        desc_hl = "String",
        action = function()
          require("oil").open_float()
        end,
        key = "e",
      },
      {
        desc = "Find Workspaces",
        desc_hl = "SpecialComment",
        action = "Telescope workspaces",
        key = "w",
      },
      {
        desc = "Configuration",
        desc_hl = "Conceal",
        action = "CustomOpen",
        key = "c",
      },
    },
  },
}

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  main = "dashboard",
  opts = opts,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
