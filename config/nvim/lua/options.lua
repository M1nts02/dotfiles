local cmd = vim.api.nvim_command
local opt = vim.opt
local g = vim.g
local o = vim.o

o.backspace = "indent," .. "eol," .. "start"
o.encoding = "utf-8"
o.foldlevelstart = 99
o.foldmethod = "indent"
o.ignorecase = true
o.incsearch = false
o.infercase = true
o.laststatus = 3
o.omnifunc = "syntaxcomplete#Complete"
o.pumheight = 15
o.shiftround = true
o.showbreak = "+---"
o.showtabline = 0
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.timeoutlen = 500
o.virtualedit = "block"
o.wildignorecase = true
o.winblend = 0
o.writebackup = false

opt.expandtab = true
opt.fileencodings = "utf-8,gbk,ucs-bom,default,latin1"
opt.fillchars = { eob = " " }
opt.inccommand = "split"
opt.list = true
opt.listchars = { tab = "»·", nbsp = "+", trail = "·", extends = "→", precedes = "←" }
opt.mouse = "nvic"
opt.pumborder = "rounded"
opt.scrolloff = 10
opt.shiftwidth = 2
opt.shortmess:append { I = true, c = true, C = true }
opt.signcolumn = "yes"
opt.softtabstop = -1
opt.tabstop = 2
opt.termguicolors = true
opt.undofile = true
opt.whichwrap:append "<>[]hl"
opt.wildoptions = { "fuzzy", "pum", "tagfile" }

g.loaded_netrw = 1
g.mapleader = " "
g.dark_theme = "habamax"
g.light_theme = "zellner"

--cmd "unmenu PopUp"
cmd "filetype indent off"

-- Use ripgrep
if vim.fn.executable "rg" == 1 then
  vim.o.grepprg = "rg --vimgrep "
  vim.o.grepformat = "%f:%l:%c:%m"
end

-- Run after UIEnter
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)
