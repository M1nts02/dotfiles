local keys = {
  {
    "<Space>tt",
    "<CMD>ToggleTheme<CR>",
    desc = "Theme",
  },
}

local opts = {
  following_system = vim.g.following_system,
  start_only = vim.g.start_only,
  light_mode = function()
    vim.cmd "colorscheme akane-light"
  end,
  dark_mode = function()
    vim.cmd "colorscheme akane-dark"
  end,
}

return {
  "M1nts02/toggle-theme.nvim",
  lazy = false,
  event = "VeryLazy",
  priority = 1000,
  keys = keys,
  opts = opts,
  dependencies = {
    {
      "M1nts02/akane.nvim",
      opts = { transparent = vim.g.transparent },
    },
  },
}
