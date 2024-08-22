local lspconfig = require "lspconfig"
local executable = require("modules.utils").executable

local lsp_servers = {
  ["autotools_ls"] = "autotools-language-server",
  ["bashls"] = "bash-language-server",
  ["biome"] = "",
  ["clangd"] = vim.g.is_mac and "/usr/bin/clangd" or "",
  ["cmake"] = "cmake-language-server",
  ["csharp_ls"] = "csharp-ls",
  ["gdscript"] = vim.g.is_mac and "/Applications/Godot.app/Contents/MacOS/Godot" or "",
  ["gopls"] = "",
  ["jedi_language_server"] = "jedi-language-server",
  ["jdtls"] = "",
  ["jsonls"] = "vscode-json-language-server",
  ["lua_ls"] = "lua-language-server",
  ["marksman"] = "",
  ["neocmake"] = "neocmakelsp",
  ["nushell"] = "nu",
  ["pylsp"] = "",
  ["rust_analyzer"] = "rust-analyzer",
  ["sqls"] = "",
  ["taplo"] = "",
  ["zls"] = "",
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

for lsp, cmd in pairs(lsp_servers) do
  cmd = cmd == "" and lsp or cmd
  if executable(cmd) then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}
