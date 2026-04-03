local M = {}
local palette = {}

M.set = function(theme)
  vim.api.nvim_command "hi clear"
  if vim.fn.exists "syntax_on" then
    vim.api.nvim_command "syntax reset"
  end

  vim.g.VM_theme_set_by_colorscheme = true
  vim.o.termguicolors = true
  vim.g.colors_name = "akane"

  palette = require("colorscheme.palette")[theme]

  require("colorscheme.terminal").set_terminal_hl(palette)
  require("colorscheme.groups").set_groups_hl(palette)
end

M.init = function()
  require "colorscheme.load"
end

return M
