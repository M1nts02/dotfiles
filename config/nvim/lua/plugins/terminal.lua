local executable = require("modules.utils").executable

local opts = {
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  autochdir = false,
  start_in_insert = true,
  direction = "float",
  close_on_exit = true,
  auto_scroll = true,
  float_opts = { border = "curved" },
  winbar = { enabled = false },
}

local keys = {
  [[<C-\>]],
  {
    "<Space>gl",
    function()
      if executable "lazygit" then
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new {
          cmd = "lazygit",
          hidden = true,
          direction = "tab",
        }
        lazygit:toggle()
      else
        vim.notify "lazygit is not installed"
      end
    end,
    desc = "lazygit",
  },
}

return {
  "akinsho/toggleterm.nvim",
  keys = keys,
  main = "toggleterm",
  opts = opts,
}
