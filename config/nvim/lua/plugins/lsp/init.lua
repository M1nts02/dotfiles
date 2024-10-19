return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "plugins.lsp.lspconfig"
      require "plugins.lsp.options"
    end,
    dependencies = { "b0o/schemastore.nvim" },
  },
  {
    "lewis6991/hover.nvim",
    event = { "LspAttach" },
    keys = require("plugins.lsp.hover").keys,
    config = require("plugins.lsp.hover").config,
  },
  {
    "stevearc/aerial.nvim",
    cmd = require("plugins.lsp.aerial").cmd,
    keys = require("plugins.lsp.aerial").keys,
    config = require("plugins.lsp.aerial").config,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
