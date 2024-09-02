-- diagnostics
vim.api.nvim_create_user_command("Diagnostics", function()
  vim.diagnostic.setloclist()
end, {
  desc = "Diagnostics",
})

-- workspaces diagnostics
vim.api.nvim_create_user_command("DiagnosticsWorkspace", function()
  vim.diagnostic.setqflist()
end, {
  desc = "Diagnostics Workspace",
})

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
end, { desc = "Grep (Case Sensitive)" })
