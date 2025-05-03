local opts = require "plugins.lsp.options"
local on_attach = opts.on_attach
local capabilities = opts.capabilities

vim.lsp.config("clangd", {
  cmd = { "/usr/bin/clangd" },
  on_attach = on_attach,
  capabilities = capabilities,
})
