local M = { "folke/snacks.nvim", lazy = false }

local header = [[
⠀⠀⣸⣿⣿⣿⡏⠀⡀⠀⠀⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠘⡇⠀⢷⠀⠀⠀⠀⠀⠀⠀⠈⡅⠀⠀⢀⠀⠀⠀⠘⡆⠀⠀
⠀⠀⣿⣿⣿⡟⠀⢀⡇⠀⢠⡏⣀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⣁⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⢱⠀⠀⠀⠆⠀⠀⠀⢳⠀⠀
⠀⠀⣿⣿⣿⠃⠀⠘⠃⠀⢸⡇⠛⠀⠀⠀⠀⠀⠀⠀⢀⡏⢀⠀⠀⠀⠀⠀⢉⠀⠈⠀⠀⠀⠄⠀⢸⠀⠀⠀⡆⠀⠀⠟⠀⠀⠀⠸⠀⠀
⠀⢸⣿⣿⡟⠀⠀⣸⠀⠀⣾⠃⡇⠀⠀⠀⠀⠀⣀⠀⢰⡇⢸⡇⠀⠸⢂⠀⠸⡀⠀⡇⠀⠀⣴⠀⠀⡄⠀⠀⣦⠀⠀⠸⠀⠀⠀⠀⠇⠀
⠀⢼⣿⣿⠇⣆⣠⣿⠤⣾⣿⣀⠁⢠⡄⠀⠀⠀⡿⠀⣼⡇⢸⡇⠀⠀⣿⡄⠀⡇⠀⡇⠀⠀⣿⠀⠀⡄⠀⠀⢉⠀⠀⠀⡇⠀⠀⠀⢰⠀
⠀⢸⣿⣿⢹⡏⣿⢿⢀⣿⣿⢸⠀⢸⣇⢀⠀⠀⣾⢟⣿⣿⢻⣷⣤⣀⢡⠧⠀⡇⠀⡇⠀⠀⣿⠀⠀⣇⠀⠀⢸⠀⠀⠀⢀⠀⠀⠀⠘⠀
⠀⣾⣿⢸⣼⣿⢇⠈⣼⣿⠘⣸⣿⠸⣿⡈⠀⠀⣿⣸⠏⠘⡺⣿⡘⡏⠻⢼⡄⠁⠀⡇⠀⠀⣿⠀⢠⣿⠀⠀⠘⠄⢀⠀⢸⠀⠀⢠⢰⡇
⠀⣿⣿⠘⢱⣽⣿⢿⣿⣮⡣⢽⢠⠀⣿⣇⢀⡀⣿⠏⣠⣐⣻⣿⢧⢿⣸⣇⣇⠀⠀⡇⠀⠀⣿⠀⢸⣿⠀⠀⠀⡇⢠⠀⢸⠀⠀⢠⠀⠅
⠀⣿⣿⣴⠈⠋⠀⢀⣀⢹⣿⡾⢷⢣⣻⢸⡸⣧⢋⠀⠉⣽⣾⣿⣷⣧⢺⠓⣿⡀⣀⠁⠀⠀⠉⠀⢸⣿⠀⠀⠀⡇⢸⠀⢠⠀⠀⢸⡇⡇
⠀⣿⣿⣿⡆⠀⠀⠘⣿⢿⣿⡇⠀⠁⠉⠋⠀⠀⠁⠃⠀⠀⠀⡌⠉⢻⣿⣷⣍⢻⣹⠀⠀⠀⡇⠀⣿⣿⣄⡀⠀⡇⢸⠀⢸⡇⠀⢸⡇⡇
⠀⣿⣿⣿⣿⠀⠀⠀⠙⢦⠼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣿⣿⡿⠻⢆⣿⠀⠀⠀⠇⢀⣋⣭⣤⢱⠀⡇⠀⠀⣸⡇⠀⢸⡇⠙
⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣆⣩⡿⠃⠀⠀⡿⠀⠀⢠⠀⢸⣿⣿⡿⢹⠀⠃⠀⣆⣻⠇⠀⢸⡇⠀
⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⡍⠀⢸⠀⢸⣿⣿⢀⡎⢰⠀⠀⣿⣿⠀⠀⣿⡇⠀
⠀⢿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣇⠃⠀⡈⢀⣿⡿⣷⠋⠀⣸⠀⠀⣿⣿⠆⠀⣿⡇⠀
⠀⢸⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡘⠀⠀⠇⣈⣩⣾⣿⠀⠀⣿⠀⢰⣿⣿⠀⢰⣟⠁⠄
⠀⢸⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠠  ⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣈⡃⠀⠀⠀⣿⣿⣿⣿⠀⠀⣿⠀⢸⣿⣿⠀⣾⢹⠀⡀
⠀⢸⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⠃⠀⠀⢰⣿⣿⣿⡏⠀⣸⡇⠀⣿⣿⡟⢰⠇⠸⢀⠀
⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⣿⣿⡇⠀⣀⢀⣿⣿⣿⣿⠁⢀⣿⠁⢸⣿⣿⣇⠂⠀⣄⠌⠀
⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⣀⣀⣠⣤⣶⣿⣿⣿⣿⣿⣿⣿⠁⢠⡇⣸⣿⣿⣿⡇⠀⣸⡇⢀⣾⣿⡿⠊⠀⣐⡾⠀⠀
⠀⠀⢻⣯⢿⣿⣿⣿⣿⠹⣿⡟⣿⡿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⢠⣿⣼⣿⣿⣿⡟⠁⠌⡽⠁⣽⡿⣽⠃⠀⠠⠋⠀⠀⠀
⠀⠀⠀⢻⡀⠻⣿⣇⠻⠆⠀⠛⠈⠁⠈⠁⠘⠋⠈⢿⣿⣿⣿⣿⣿⣿⣿⠏⣠⣾⣷⣿⣿⡇⠾⠐⠠⠖⢈⠴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀
]]

M.keys = {
  {
    "<C-\\>",
    function()
      require("snacks").terminal.toggle()
    end,
    desc = "Terminal",
    mode = { "n", "i", "t" },
  },
}

function M.config()
  local Snacks = require "snacks"
  Snacks.setup {
    bigfile = { enabled = false },
    dashboard = {
      enabled = true,
      Text = {},
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
      preset = {
        header = header,
        keys = {
          { icon = " ", key = "p", desc = "Plugin", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "m", desc = "Mason", action = ":Mason" },
          { icon = " ", key = "t", desc = "Dark Mode", action = ":DarkMode" },
          { icon = "󰊢 ", key = "g", desc = "Git", action = ":Neogit" },
          { icon = "󰕲 ", key = "z", desc = "Zoxide", action = ":FzfLua zoxide" },
          { icon = " ", key = "s", desc = "Settings", action = ":Settings" },
          { icon = " ", key = "c", desc = "Configuration", action = ":CustomOpen" },
        },
      },
    },
    terminal = { win = { style = "terminal" }, keys = {} },
    statuscolumn = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    words = { enabled = false },
  }
end

return M
