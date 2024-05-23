local utils = require "modules.utils"

return {
  -- Buffer manager
  {
    "glepnir/flybuf.nvim",
    cmd = "FlyBuf",
    keys = { { "<Space>b", "<CMD>FlyBuf<CR>", desc = "Buffers" } },
    opts = { border = "rounded" },
  },

  -- Code format
  {
    "stevearc/conform.nvim",
    event = { "BufRead", "BufNewFile" },
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
    dependencies = {
      "nushell/tree-sitter-nu",
    },
  },

  -- Template
  {
    "M1nts02/nvim-template",
    cmd = { "Templ", "TemplAdd", "TemplDel" },
    opts = {
      templ_dir = vim.fn.stdpath "config" .. "/template",
      templ_register_file = vim.fn.stdpath "config" .. "/template.json",
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
