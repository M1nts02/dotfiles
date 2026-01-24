local M = {
  "neovim/nvim-lspconfig",
  dependencies = { "folke/lazydev.nvim", "b0o/schemastore.nvim" },
}

function M.config()
  local executable = Utils.executable
  local lsp_servers = {
    ["autotools_ls"] = "autotools-language-server",
    ["bashls"] = "bash-language-server",
    ["biome"] = "",
    ["clangd"] = "",
    ["cmake"] = "cmake-language-server",
    ["csharp_ls"] = "csharp-ls",
    ["gdscript"] = "",
    ["gopls"] = "",
    ["jdtls"] = "",
    ["jsonls"] = "vscode-json-language-server",
    ["lua_ls"] = "lua-language-server",
    ["markdown_oxide"] = "markdown-oxide",
    ["marksman"] = "",
    ["neocmake"] = "neocmakelsp",
    ["ols"] = "",
    ["pylsp"] = "",
    ["pyright"] = "",
    ["rust_analyzer"] = "rust-analyzer",
    ["sourcekit"] = "sourcekit-lsp",
    ["sqls"] = "",
    ["zls"] = "",
  }

  local function on_attach(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

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
  vim.lsp.config("lua_ls", {
    on_attach = on_attach,
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  })
  vim.lsp.config("jsonls", {
    on_attach = on_attach,
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  })

  for lsp, cmd in pairs(lsp_servers) do
    cmd = cmd == "" and lsp or cmd
    if executable(cmd) then
      vim.lsp.enable(lsp)
    end
  end

  -- for mac
  if isMac then
    vim.lsp.config("clangd", {
      cmd = { "/usr/bin/clangd" },
      on_attach = on_attach,
    })
  end

  require("lazydev").setup {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
    enabled = function(root_dir)
      return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
    end,
  }
end

return M
