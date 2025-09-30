local function config()
  local utils = require "modules.utils"
  local executable = utils.executable

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
    ["sqls"] = "",
    ["zls"] = "",
  }

  local capabilities = require("blink.cmp").get_lsp_capabilities {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
    completion = {
      completionItem = {
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
      },
    },
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

  -- virtual_lines
  vim.diagnostic.config {}
  if vim.g.dianostic_virtualtext == true then
    vim.diagnostic.config { virtual_lines = { current_line = true }, float = { border = "rounded" } }
  else
    vim.diagnostic.config { virtual_lines = false, float = { border = "rounded" } }
  end

  vim.lsp.config("*", { on_attach = on_attach, capabilities = capabilities })
  vim.lsp.config("lua_ls", {
    on_attach = on_attach,
    capabilities = capabilities,
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
    capabilities = capabilities,
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
  if vim.g.is_mac then
    vim.lsp.config("clangd", {
      cmd = { "/usr/bin/clangd" },
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/lazydev.nvim",
    "saghen/blink.cmp",
    "b0o/schemastore.nvim",
    "LelouchHe/xmake-luals-addon",
  },
  config = function()
    config()
    require("lazydev").setup {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "xmake-luals-addon/library", files = { "xmake.lua" } },
      },
      enabled = function(root_dir)
        return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
      end,
    }
  end,
}
