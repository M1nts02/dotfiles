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
        local h = math.floor(vim.opt.lines:get() * 1)
        local w = math.floor(vim.opt.columns:get() * 1)

        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new {
          cmd = "lazygit",
          hidden = true,
          direction = "float",
          float_opts = {
            width = w < 40 and 40 or w,
            height = h < 15 and 15 or h,
          },
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
