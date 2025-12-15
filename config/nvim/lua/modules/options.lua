local cmd = vim.api.nvim_command
local opt = vim.opt
local g = vim.g
local o = vim.o

o.wildignorecase = true
o.writebackup = false
o.swapfile = false
o.shiftround = true
o.ignorecase = true
o.smartcase = true
o.infercase = true
o.incsearch = false
o.splitbelow = true
o.splitright = true
o.showmode = false
o.ruler = false
o.showcmd = true
o.timeoutlen = 500
o.foldlevelstart = 99
o.showtabline = 0
o.pumheight = 15
o.laststatus = 3
o.pumblend = 0
o.winblend = 0
o.helpheight = 80
o.cmdheight = 1
o.mouse = "nvic"
o.virtualedit = "block"
o.encoding = "utf-8"
o.foldmethod = "indent"
o.backspace = "indent," .. "eol," .. "start"
o.showbreak = "+---"
o.omnifunc = "syntaxcomplete#Complete"

opt.inccommand = "split"
opt.list = true
opt.listchars = { tab = "»·", nbsp = "+", trail = "·", extends = "→", precedes = "←" }
opt.undofile = true
opt.expandtab = true
opt.fileencodings = "utf-8,gbk,ucs-bom,default,latin1"
opt.termguicolors = true
opt.tabstop = 2
opt.scrolloff = 10
opt.signcolumn = "yes"
opt.shiftwidth = 2
opt.shortmess:append { c = true }
opt.softtabstop = -1
opt.whichwrap:append "<>[]hl"
opt.fillchars = { eob = " " }

g.mapleader = "\\"
g.loaded_netrw = 1
g.netrw_banner = 1
g.loaded_netrwPlugin = 1
--g.netrw_winsize = 20
g.netrw_liststyle = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_logipat = 1
g.loaded_rrhelper = 1
g.loaded_spellfile_plugin = 1
g.loaded_matchit = 1

--cmd "unmenu PopUp"
cmd "filetype indent off"

-- Add env for mason
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (vim.g.is_windows and ";" or ":") .. vim.env.PATH

-- Use ripgrep
if vim.fn.executable "rg" == 1 then
  vim.o.grepprg = "rg --vimgrep "
  vim.o.grepformat = "%f:%l:%c:%m"
end

-- Run after UIEnter
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- dap
vim.fn.sign_define("DapBreakpoint", {
  text = "⊚",
  texthl = "LspDiagnosticsSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("Dapstooped", {
  text = "❀",
  texthl = "LspDiagnosticsSignHint",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "▷",
  texthl = "LspDiagnosticsSignInformation",
  linehl = "DiagnosticUnderlineInfo",
  numhl = "LspDiagnosticsSignInformation",
})
