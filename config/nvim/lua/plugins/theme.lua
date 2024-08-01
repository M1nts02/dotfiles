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
  priority = 1000,
  opts = opts,
  dependencies = {
    {
      "M1nts02/akane.nvim",
      opts = { transparent = vim.g.transparent },
    },
  },
}
