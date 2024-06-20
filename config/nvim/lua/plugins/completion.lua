return {
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    cmd = { "CmpToggle" },
    init = function()
      vim.g.cmp_disable = false
    end,
    config = function()
      require "configs.nvim-cmp"
    end,
    dependencies = {
      "hrsh7th/cmp-path", -- Support path
      "hrsh7th/cmp-nvim-lsp", -- Support LSP
      "hrsh7th/cmp-buffer", -- Buffer
      { -- AI
        "luozhiya/fittencode.nvim",
        opts = {
          completion_mode = "source",
          disable_specific_inline_completion = {
            suffixes = { "csv", "log", "md", "org", "tsv", "txt" },
          },
        },
      },
      { -- Neovim lua api
        "folke/lazydev.nvim",
        ft = "lua",
        opts = { library = { { path = "luvit-meta/library", words = { "vim%.uv" } } } },
        dependencies = { { "Bilal2453/luvit-meta", lazy = true } },
      },
    },
  },

  -- Command line
  {
    "hrsh7th/cmp-cmdline",
    keys = { ":", "/", "?" },
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-path", -- Path
      "hrsh7th/cmp-buffer", -- Buffer
    },
    opts = require("configs.cmp-cmdline").opts,
    config = require("configs.cmp-cmdline").config,
  },
}
