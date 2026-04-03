return {
  "neovim/nvim-lspconfig",
  config = function()
    local function on_attach(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
      client.server_capabilities.documentRangeFormattingProvider = true

      -- inlay hints
      if client.server_capabilities.inlayHintProvider then
        if vim.g.inlay_hints == true then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end
      end
    end

    -- virtual_lines
    vim.diagnostic.config {}
    if vim.g.dianostic_virtualtext == true then
      vim.diagnostic.config { virtual_lines = { current_line = true }, float = { border = "rounded" } }
    else
      vim.diagnostic.config { virtual_lines = false, float = { border = "rounded" } }
    end

    vim.lsp.config("*", { on_attach = on_attach })
    vim.lsp.config("sourcekit", { on_attach = on_attach, filetypes = { "swift", "objc", "objcpp" } })
    vim.lsp.config("clangd", { on_attach = on_attach, cmd = { isMac and "/usr/bin/clangd" or "clangd" } })
    vim.lsp.config("lua_ls", { on_attach = on_attach, settings = { Lua = { completion = { callSnippet = "Replace" } } }, })

    for _, lsp in pairs { "basedpyright", "bashls", "clangd", "jsonls", "lua_ls", "markdown_oxide", "sourcekit", "zls" } do
      vim.lsp.enable(lsp)
    end
  end,
}
