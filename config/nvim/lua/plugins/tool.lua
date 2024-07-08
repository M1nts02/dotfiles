local utils = require "modules.utils"

return {
  -- File browser
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    keys = { { "<Space>e", "<CMD>NvimTreeFindFileToggle<CR>", desc = "File browser" } },
    config = require("configs.nvim-tree").config,
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
    "nvim-telescope/telescope.nvim",
    version = "*",
    cmd = { "Telescope" },
    keys = require("configs.telescope").keys,
    opts = require("configs.telescope").opts,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- FZF
  {
    "junegunn/fzf",
    version = "*",
    build = "fzf#install()",
    cmd = { "FZF" },
    keys = require("configs.fzf").keys,
    config = require("configs.fzf").config,
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

  -- Neogit
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    keys = { { "<Space>gn", "<CMD>Neogit<CR>", desc = "Neogit" } },
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  },

  -- Which key
  {
    "folke/which-key.nvim",
    keys = require("configs.which-key").keys,
    config = require("configs.which-key").config,
  },
}
