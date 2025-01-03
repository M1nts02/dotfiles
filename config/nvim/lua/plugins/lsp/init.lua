return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "plugins.lsp.servers"
      if vim.g.is_mac then
        require "plugins.lsp.servers_mac"
      end
    end,
    dependencies = { "b0o/schemastore.nvim" },
  },
  { -- hover
    "lewis6991/hover.nvim",
    event = { "LspAttach" },
    keys = require("plugins.lsp.hover").keys,
    config = require("plugins.lsp.hover").config,
  },
  { -- outline
    "stevearc/aerial.nvim",
    cmd = require("plugins.lsp.aerial").cmd,
    keys = require("plugins.lsp.aerial").keys,
    config = require("plugins.lsp.aerial").config,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
      "saghen/blink.cmp",
    },
  },
}
