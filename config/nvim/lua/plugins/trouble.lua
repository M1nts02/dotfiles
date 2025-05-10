local utils = require "modules.utils"
local setmap = utils.setmap

-- grep
vim.api.nvim_create_user_command("Rg", function()
  local arg = vim.fn.input "Grep: "

  if arg == "" or arg == nil then
    return
  end

  local ic = vim.opt.ignorecase
  vim.opt.ignorecase = true
  pcall(vim.cmd, "vimgrep /" .. arg .. "/gj **")
  vim.opt.ignorecase = ic
  vim.cmd "Trouble qflist"
end, {
  desc = "Grep",
})

-- grep (case sensitive)
vim.api.nvim_create_user_command("Rgc", function()
  local arg = vim.fn.input "Grep: "
  if arg == "" or arg == nil then
    return
  end

  local ic = vim.opt.ignorecase
  vim.opt.ignorecase = false
  pcall(vim.cmd, "vimgrep /" .. arg .. "/gj **")
  vim.opt.ignorecase = ic
  vim.cmd "Trouble qflist"
end, { desc = "Grep (Case Sensitive)" })

require("trouble").setup {
  focus = true,
  modes = {
    symbols = {
      focus = true,
    },
  },
}

setmap {
  { { "n" }, "<Space>fG", "<CMD>Rgc<CR>", { noremap = true, desc = "Grep Case" }},
  { { "n" }, "<Space>fg", "<CMD>Rg<CR>",  { noremap = true, desc = "Grep" }},
  { { "n" }, "<Space>fq", "<CMD>Trouble qflist toggle<CR>", desc = "Quickfix" },
  { { "n" }, "gd", "<CMD>Trouble lsp_definitions<CR>",           { noremap = true, desc = "Definition" }},
  { { "n" }, "gO", "<CMD>Trouble symbols toggle<CR>",            { noremap = true, desc = "Symbols" }},
  { { "n" }, "grd", "<CMD>Trouble diagnostics toggle<CR>",       { noremap = true, desc = "Diagnostics" }},
  { { "n" }, "gri", "<CMD>Trouble lsp_implementations<CR>",      { noremap = true, desc = "Implementations" }},
  { { "n" }, "gro", "<CMD>Trouble lsp_outgoing_calls toggle<CR>",{ noremap = true, desc = "Outgoing Calls" }},
  { { "n" }, "grr", "<CMD>Trouble lsp_references toggle<CR>",    { noremap = true, desc = "References" }},
}
