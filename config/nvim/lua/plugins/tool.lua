local utils = require "modules.utils"

return {
  -- File browser
  {
    "echasnovski/mini.files",
    version = "*",
    keys = {
      {
        "<Space>e",
        function()
          require("mini.files").open()
        end,
        desc = "Mini-files",
      },
    },
    opts = { mappings = { show_help = "?" } },
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
    cmd = { "FzfLua" },
    keys = require("configs.fzf-lua").keys,
    opts = require("configs.fzf-lua").opts,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "junegunn/fzf",
        enabled = not utils.executable "fzf",
        build = "./install --bin",
      },
    },
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    keys = require("configs.toggleterm").keys,
    main = "toggleterm",
    opts = require("configs.toggleterm").opts,
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    opts = {
      integrations = { diffview = true },
      commit_editor = { staged_diff_split_kind = "auto" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
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
    dependencies = {
      { -- Hydra
        "nvimtools/hydra.nvim",
        config = require("configs.hydra").config,
      },
    },
  },
}
