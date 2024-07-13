vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  title = "  hover ",
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  signs = true,
  update_in_insert = false,
})

vim.diagnostic.config {
  float = { border = "rounded" },
  virtual_text = vim.g.dianostic_virtualtext,
}

-- Enable cmp when LspAttach is triggered
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.b[args.buf].cmp_disable = false
  end,
})

-- Toggle diagnostic virtual text
vim.api.nvim_create_user_command("ToggleDianosticVirtualText", function()
  vim.g.dianostic_virtualtext = not vim.g.dianostic_virtualtext
  vim.diagnostic.config { virtual_text = vim.g.dianostic_virtualtext }
end, {
  desc = "Toggle Dianostic VirtualText",
})

-- Toggle inlay hints
vim.api.nvim_create_user_command("ToggleInlayHints", function()
  vim.g.inlay_hints = not vim.g.inlay_hints
  local enable = vim.g.inlay_hints and "true" or "false"
  vim.cmd("tabdo windo lua vim.lsp.inlay_hint.enable(" .. enable .. ", { bufnr = 0 })")
end, {
  desc = "Toggle Dianostic VirtualText",
})
