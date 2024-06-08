local utils = require "modules.utils"

return {
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
    keys = { [[<C-\>]] },
    main = "toggleterm",
    opts = require("configs.toggleterm").opts,
  },

  -- File browser
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = require("configs.nvim-tree").keys,
    opts = require("configs.nvim-tree").opts,
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    keys = { { "<Space>gn", "<CMD>Neogit<CR>", desc = "Neogit" } },
    main = "neogit",
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
    keys = require("configs.gitsigns").keys,
    opts = require("configs.gitsigns").opts,
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
