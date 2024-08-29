local lspconfig = require "lspconfig"

local lsp_servers = {
  "autotools_ls",
  "bashls",
  "biome",
  "clangd",
  "cmake",
  "csharp_ls",
  "gdscript",
  "gopls",
  "jdtls",
  "jsonls",
  "lua_ls",
  "marksman",
  "neocmake",
  "nushell",
  "pylsp",
  "rust_analyzer",
  "sqls",
  "taplo",
  "zls",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
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

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local function on_attach(client, bufnr)
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

for _, lsp in pairs(lsp_servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}

if vim.g.is_mac then
  lspconfig.clangd.setup {
    cmd = { "/usr/bin/clangd" },
    on_attach = on_attach,
    capabilities = capabilities,
  }
  lspconfig.gdscript.setup {
    cmd = { "/Applications/Godot.app/Contents/MacOS/Godot" },
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
