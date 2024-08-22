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
    "<Space>gg",
    function()
      if executable "gitui" then
        local Terminal = require("toggleterm.terminal").Terminal
        local gitui = Terminal:new { cmd = "gitui", hidden = true, direction = "tab" }
        gitui:toggle()
      else
        vim.notify "Gitui is not installed"
      end
    end,
    desc = "Gitui",
  },
}

return {
  "akinsho/toggleterm.nvim",
  keys = keys,
  main = "toggleterm",
  opts = opts,
}
