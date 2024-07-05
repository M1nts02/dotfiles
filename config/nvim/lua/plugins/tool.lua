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
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        enabled = utils.executable { "cmake", "make" } and utils.executable { "gcc", "clang", "cc", "cl" },
        build = utils.executable "cmake"
            and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
          or "make",
        config = function()
          require("telescope").setup { extensions = { fzf = { fuzzy = false } } }
          require("telescope").load_extension "fzf"
        end,
      },
      {
        "LukasPietzschmann/telescope-tabs",
        keys = {
          {
            "<Space>f<Tab>",
            function()
              require("telescope-tabs").list_tabs()
            end,
            desc = "Tabs",
          },
        },
        config = function()
          require("telescope").load_extension "telescope-tabs"
          require("telescope-tabs").setup {}
        end,
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
