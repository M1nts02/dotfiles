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
