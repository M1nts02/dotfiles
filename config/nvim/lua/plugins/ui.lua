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

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {
      input = { enabled = false },
    },
  },

  -- Previewe for quick window
  {
    "kevinhwang91/nvim-bqf",
    event = "QuickFixCmdPre",
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = { "BufRead", "BufNewFile" },
    config = require("configs.lualine").config,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/aerial.nvim",
      {
        "linrongbin16/lsp-progress.nvim",
        opts = require("configs.lsp-progress").opts,
      },
    },
  },

  -- Status column
  {
    "luukvbaal/statuscol.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "configs.statuscol"
    end,
    dependencies = {
      "lewis6991/gitsigns.nvim",
    },
  },
}
