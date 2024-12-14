local M = {}

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

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

function M.on_attach(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  -- inlay hints
  if client.server_capabilities.inlayHintProvider then
    local inlay_hints_group = vim.api.nvim_create_augroup("InlayHints", { clear = false })

    if vim.g.inlay_hints == true then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    -- Disable inlay hints with insert mode and visual mode
    vim.api.nvim_create_autocmd("ModeChanged", {
      group = inlay_hints_group,
      buffer = bufnr,
      callback = function(args)
        if not vim.g.inlay_hints then
          return
        end
        local mode = vim.fn.mode()
        if mode == "i" or mode == "v" or mode == "V" or mode == "\22" or mode == "R" then
          if vim.lsp.inlay_hint.is_enabled { bufnr = bufnr } then
            vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
          end
        else
          if not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr } then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          end
        end
      end,
    })
  end
end

return M
