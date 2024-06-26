local M = {}

local executable = require("modules.utils").executable

M.opts = {
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

M.keys = {
  [[<C-\>]],
  {
    "<Space>gg",
    function()
      if executable "gitui" then
        local Terminal = require("toggleterm.terminal").Terminal
        local gitui = Terminal:new { cmd = "gitui", hidden = true }
        gitui:toggle()
      else
        vim.notify "Don't install gitui"
      end
    end,
    desc = "Gitui",
  },
}

return M
