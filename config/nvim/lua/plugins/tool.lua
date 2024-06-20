local utils = require "modules.utils"

return {
  -- File browser
  {
    "simonmclean/triptych.nvim",
    keys = { { "<Space>e", "<CMD>Triptych<CR>", desc = "File browser" } },
    opts = { options = { backdrop = 100, border = "rounded" } },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- Install tool
  {
    "williamboman/mason.nvim",
    main = "mason",
    cmd = require("configs.mason").cmd,
    opts = require("configs.mason").opts,
  },

  -- Color highlighting
  {
    "NvChad/nvim-colorizer.lua",
    cmd = {
      "ColorizerAttachToBuffer",
      "ColorizerDetachFromBuffer",
      "ColorizerReloadAllBuffers",
      "ColorizerToggle",
    },
    main = "colorizer",
    opts = {},
  },

  -- Workspace
  {
    "natecraddock/workspaces.nvim",
    cmd = require("configs.workspaces").cmd,
    keys = require("configs.workspaces").keys,
    opts = require("configs.workspaces").opts,
  },

  -- Session
  {
    "nvimdev/dbsession.nvim",
    cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
    opts = {},
  },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Search
  {
    "ibhagwan/fzf-lua",
    enabled = utils.executable "fzf",
    cmd = { "FzfLua" },
    keys = require("configs.fzf-lua").keys,
    opts = require("configs.fzf-lua").opts,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    keys = require("configs.toggleterm").keys,
    main = "toggleterm",
    opts = require("configs.toggleterm").opts,
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    cmd = { "Gitsigns" },
    event = { "BufRead", "BufNewFile" },
    opts = { signcolumn = true },
  },

  -- Which key
  {
    "folke/which-key.nvim",
    keys = require("configs.which-key").keys,
    config = require("configs.which-key").config,
  },
}
