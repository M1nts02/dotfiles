-- Open cache file
vim.api.nvim_create_user_command("CustomOpen", function()
  vim.cmd("e " .. CachePath)
end, {
  desc = "Open cache file",
})

-- Toggle Wrap
vim.api.nvim_create_user_command("WrapToggle", function()
  local s = not vim.opt.wrap:get()
  vim.opt.wrap = s
  local i = s == true and "true" or "false"
  vim.cmd("tabdo windo lua vim.opt.wrap = " .. i)
  Cache.update { opt = { wrap = s } }
end, {
  desc = "Toggle wrap",
})

-- Toggle inlay hints
vim.api.nvim_create_user_command("InlayHints", function()
  local s = not vim.g.inlay_hints
  vim.g.inlay_hints = s
  local enable = s and "true" or "false"
  vim.cmd("tabdo windo lua vim.lsp.inlay_hint.enable(" .. enable .. ", { bufnr = 0 })")
  Cache.update { g = { inlay_hints = s } }
end, {
  desc = "Toggle inlay hints",
})

-- Toggle virtual text
vim.api.nvim_create_user_command("VirtualText", function()
  vim.g.dianostic_virtualtext = not vim.g.dianostic_virtualtext
  if vim.g.dianostic_virtualtext == true then
    vim.diagnostic.config { virtual_lines = { current_line = true } }
  else
    vim.diagnostic.config { virtual_lines = false }
  end
  Cache.update { g = { dianostic_virtualtext = vim.g.dianostic_virtualtext } }
end, {
  desc = "Toggle virtual text",
})
