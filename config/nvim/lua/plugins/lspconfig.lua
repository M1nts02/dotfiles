local function on_attach(client, bufnr)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true

  -- inlay hints
  if client.server_capabilities.inlayHintProvider then
    if vim.g.virtual_text == true then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end
end

-- Config LSP
vim.lsp.config("*", { on_attach = on_attach })
vim.lsp.config("sourcekit", { on_attach = on_attach, filetypes = { "swift" } })
vim.lsp.config("clangd", {
  on_attach = on_attach,
  cmd = {
    isMac and "/usr/bin/clangd" or "clangd",
    "--background-index",
    "-j=4",
    "--clang-tidy",
    "--all-scopes-completion",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--pch-storage=memory",
    "--function-arg-placeholders=false",
    "--cross-file-rename",
    "--enable-config",
  },
})
vim.lsp.config("lua_ls", { on_attach = on_attach, settings = { Lua = { completion = { callSnippet = "Replace" } } } })
vim.lsp.config("mpls", {
  cmd = { "mpls", "--no-auto", "--theme", "dark", "--enable-emoji", "--enable-footnotes" },
  filetypes = { "markdown" },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = { "*.md" },
      group = vim.api.nvim_create_augroup("lspconfig.mpls.focus", { clear = true }),
      callback = function(ctx)
        client:notify("mpls/editorDidChangeFocus", { uri = ctx.match })
      end,
      desc = "mpls: notify buffer focus changed",
    })
    vim.api.nvim_buf_create_user_command(bufnr, "MarkdownPreview", function()
      client:exec_cmd { title = "Preview markdown with mpls", command = "open-preview" }
    end, { desc = "Preview markdown with mpls" })
  end,
})

return {
  "neovim/nvim-lspconfig",
  dependencies = {},
  config = function()
    for _, lsp in pairs {
      "basedpyright",
      "bashls",
      "clangd",
      "jsonls",
      "lua_ls",
      "markdown_oxide",
      "mpls",
      "ruff",
      "sourcekit",
      "sqruff",
      "zls",
      "zuban",
    } do
      vim.lsp.enable(lsp)
    end
  end,
}
