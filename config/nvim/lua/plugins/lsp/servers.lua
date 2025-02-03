local utils = require "modules.utils"
local executable = utils.executable
local lspconfig = require "lspconfig"
local opts = require "plugins.lsp.options"
local on_attach = opts.on_attach
local capabilities = opts.capabilities

local lsp_servers = {
  ["autotools_ls"] = "autotools-language-server",
  ["bashls"] = "bash-language-server",
  ["biome"] = "",
  ["clangd"] = "",
  ["cmake"] = "cmake-language-server",
  ["csharp_ls"] = "csharp-ls",
  ["gopls"] = "",
  ["jdtls"] = "",
  ["jedi_language_server"] = "jedi-language-server",
  ["jsonls"] = "vscode-json-language-server",
  ["lua_ls"] = "lua-language-server",
  ["markdown_oxide"] = "markdown-oxide",
  ["marksman"] = "",
  ["neocmake"] = "neocmakelsp",
  ["nushell"] = "nu",
  ["ols"] = "",
  ["pylsp"] = "",
  ["pyright"] = "",
  ["rust_analyzer"] = "rust-analyzer",
  ["sourcekit"] = "sourcekit-lsp",
  ["sqls"] = "",
  ["zls"] = "",
}

for lsp, cmd in pairs(lsp_servers) do
  cmd = cmd == "" and lsp or cmd
  if executable(cmd) then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

if executable "lua-language-server" then
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
end

if executable "vscode-json-language-server" then
  lspconfig.jsonls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  }
end
