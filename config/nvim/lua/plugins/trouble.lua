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
    event = { "VeryLazy" },
    cmd = "Trouble",
    keys = {
      { "<Space>fG", "<CMD>Rgc<CR>", desc = "Grep Case" },
      { "<Space>fg", "<CMD>Rg<CR>", desc = "Grep" },
      { "<Space>fq", "<CMD>Trouble qflist toggle<CR>", desc = "Quickfix" },
      { "gd", "<CMD>Trouble lsp_definitions<CR>", desc = "Definition" },
      { "gO", "<CMD>Trouble symbols toggle<CR>", desc = "Symbols" },
      { "grt", "<CMD>Trouble lsp_type_definitions<CR>", desc = "Type Definition" },
      { "grd", "<CMD>Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
      { "gri", "<CMD>Trouble lsp_implementations<CR>", desc = "Implementations" },
      { "gro", "<CMD>Trouble lsp_outgoing_calls toggle<CR>", desc = "Outgoing Calls" },
      { "grr", "<CMD>Trouble lsp_references toggle<CR>", desc = "References" },
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
