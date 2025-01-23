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
        local h = math.floor(vim.opt.lines:get() * 0.9)
        local w = math.floor(vim.opt.columns:get() * 0.9)

        local Terminal = require("toggleterm.terminal").Terminal
        local gitui = Terminal:new {
          cmd = "gitui",
          hidden = true,
          direction = "float",
          float_opts = {
            width = w < 40 and 40 or w,
            height = h < 15 and 15 or h,
          },
        }
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
