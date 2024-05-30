-- Please write your custom file, then save and restart.
local utils = require "modules.utils"
local executable = utils.executable

vim.g.author = "M1nts02"
vim.g.email = "zyh1032712227@outlook.com"

if vim.g.is_mac and executable "/opt/homebrew/bin/nu" then
  vim.o.shell = "/opt/homebrew/bin/nu"
end

if vim.g.is_windows and executable "nu" then
  -- Nushell on windows
  vim.o.shell = "nu"
  vim.api.nvim_command "let &shell = 'nu'"
  vim.api.nvim_command "let &shellcmdflag = '-c'"
  vim.api.nvim_command 'let &shellquote = ""'
  vim.api.nvim_command 'let &shellxquote = ""'
end

-- vim.g.transparent = true
-- vim.g.following_system = true
-- vim.g.start_only = true
-- vim.g.python3_host_prog = "python3"

-- neovide
-- if vim.g.neovide then
--   vim.o.guifont = "RecMonoCasual Nerd Font:h13"
--   vim.g.neovide_floating_shadow = false
--   vim.g.neovide_transparency = 1
-- end

-- neovim-qt
if vim.fn.has "gui_running" then
  vim.opt.guifont = "RecMonoCasual Nerd Font:h13"
end
