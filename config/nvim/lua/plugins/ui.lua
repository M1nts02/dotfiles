return {
  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    main = "dashboard",
    opts = require("configs.dashboard").opts,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  -- Toggle theme
  {
    "M1nts02/toggle-theme.nvim",
    lazy = false,
    event = "VeryLazy",
    priority = 1000,
    keys = require("configs.toggle-theme").keys,
    opts = require("configs.toggle-theme").opts,
    dependencies = {
      {
        "M1nts02/akane.nvim",
        opts = { transparent = vim.g.transparent },
      },
    },
  },

  -- Previewe for quick window
  {
    "kevinhwang91/nvim-bqf",
    event = "QuickFixCmdPre",
  },

  -- Statusline
  {
    "rebelot/heirline.nvim",
    event = { "BufRead", "BufNewFile" },
    config = require("configs.heirline").config,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "lewis6991/gitsigns.nvim",
      "stevearc/aerial.nvim",
      {
        "linrongbin16/lsp-progress.nvim",
        opts = require("configs.lsp-progress").opts,
      },
    },
  },
}
