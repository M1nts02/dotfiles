local utils = require "modules.utils"

return {
  -- Comment
  {
    "numToStr/Comment.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = {},
  },

  -- TODO
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoQuickFix", "TodoLocList" },
    opts = {},
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Code format
  {
    "stevearc/conform.nvim",
    event = { "BufRead", "BufNewFile" },
    init = require("configs.conform").init,
    config = require("configs.conform").config,
  },

  -- csv
  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = { "csv", "tsv" },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = utils.executable { "gcc", "clang", "zig", "cc", "cl" },
    build = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    cmd = require("configs.nvim-treesitter").cmd,
    init = require("configs.nvim-treesitter").init,
    config = require("configs.nvim-treesitter").config,
  },

  -- Template
  {
    "M1nts02/nvim-template",
    branch = "dev",
    cmd = { "Templ", "TemplAdd", "TemplDel" },
    opts = {
      git_info = true,
    },
  },

  -- Cursor jump
  {
    "folke/flash.nvim",
    keys = require("configs.flash").keys,
    opts = require("configs.flash").opts,
  },

  -- Undo tree
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle", "UndotreeFocus" },
  },
}
