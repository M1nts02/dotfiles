local cache = require "modules.cache"
local update = cache.update
local get_status = cache.get_status

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
        desc = "Git",
        desc_hl = "String",
        action = "Neogit",
        key = "g",
      },
      {
        desc = "Sessions",
        desc_hl = "Identifier",
        action = "SessionSelect",
        key = "s",
      },
      {
        desc = "Dark Mode",
        desc_hl = "Character",
        action = function()
          local s = not get_status().g.dark
          update { g = { dark = s } }
          if s == true then
            vim.cmd("colorscheme " .. vim.g.dark_theme)
          else
            vim.cmd("colorscheme " .. vim.g.light_theme)
          end
        end,
        key = "t",
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
