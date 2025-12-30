local cmd = vim.api.nvim_command
local opt = vim.opt
local g = vim.g
local o = vim.o

o.backspace = "indent," .. "eol," .. "start"
o.cmdheight = 1
o.encoding = "utf-8"
o.foldlevelstart = 99
o.foldmethod = "indent"
o.helpheight = 80
o.ignorecase = true
o.incsearch = false
o.infercase = true
o.laststatus = 3
o.mouse = "nvic"
o.omnifunc = "syntaxcomplete#Complete"
o.pumblend = 0
o.pumheight = 15
o.ruler = false
o.shiftround = true
o.showbreak = "+---"
o.showcmd = true
o.showmode = false
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
opt.scrolloff = 10
opt.shiftwidth = 2
opt.shortmess:append { c = true }
opt.signcolumn = "yes"
opt.softtabstop = -1
opt.tabstop = 2
opt.termguicolors = true
opt.undofile = true
opt.whichwrap:append "<>[]hl"

g.loaded_2html_plugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_logipat = 1
g.loaded_matchit = 1
g.loaded_netrw = 1
g.loaded_rrhelper = 1
g.loaded_spellfile_plugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.mapleader = "\\"

--cmd "unmenu PopUp"
cmd "filetype indent off"

-- Add env for mason
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (isWindows and ";" or ":") .. vim.env.PATH

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
