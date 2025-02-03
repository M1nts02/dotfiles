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

return {
  {
    "folke/trouble.nvim",
    version = "*",
    event = { "QuickFixCmdPre", "LspAttach" },
    cmd = "Trouble",
    keys = {
      { "<Space>fG", "<CMD>Rgc<CR>", desc = "Grep Case" },
      { "<Space>fg", "<CMD>Rg<CR>", desc = "Grep" },
      { "<Space>fq", "<CMD>Trouble qflist toggle<CR>", desc = "Quickfix" },
      { "<Space>ld", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
      { "<Space>lh", "<CMD>Trouble lsp_references toggle<CR>", desc = "References" },
      { "<Space>lo", "<CMD>Trouble lsp_outgoing_calls toggle<CR>", desc = "Outgoing Calls" },
      { "<Space>ls", "<CMD>Trouble symbols toggle<CR>", desc = "Symbols" },
      { "gd", "<CMD>Trouble lsp_definitions<CR>", desc = "Definition" },
    },
    opts = {
      focus = true,
      modes = {
        symbols = {
          focus = true,
        },
      },
    },
  },
}
