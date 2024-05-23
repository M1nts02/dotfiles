local M = {}

M.keys = {
  { "<Space>tt", "<CMD>ToggleTheme<CR>", desc = "Theme" },
}

M.opts = {
  following_system = vim.g.following_system,
  start_only = vim.g.start_only,
  light_mode = function()
    vim.cmd "colorscheme akane-light"
  end,
  dark_mode = function()
    vim.cmd "colorscheme akane-dark"
  end,
}

return M
