return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    config = require("configs.lspconfig").config,
  },

  -- Document symbols
  {
    "stevearc/aerial.nvim",
    keys = require("configs.aerial").keys,
    opts = require("configs.aerial").opts,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
