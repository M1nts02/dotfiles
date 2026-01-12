local cmd = vim.api.nvim_command
local opt = vim.opt
local g = vim.g
local o = vim.o

o.backspace = "indent," .. "eol," .. "start"
o.cmdheight = 1
o.encoding = "utf-8"
o.foldlevelstart = 99
o.foldmethod = "indent"
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
opt.wildoptions = { "tagfile", "fuzzy" }

g.loaded_netrw = 1
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
