return {
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = require("plugins.cmp.cmp").config,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Support LSP
      "hrsh7th/cmp-buffer", -- Buffer
      "hrsh7th/cmp-nvim-lsp-signature-help",
      { -- FittenCode
        "luozhiya/fittencode.nvim",
        cmd = "Fitten",
        config = require("plugins.cmp.fittencode").config,
      },
      { -- Icons
        "onsails/lspkind.nvim",
        config = require("plugins.cmp.lspkind").config,
      },
      { -- Lua api for lsp
        "folke/lazydev.nvim",
        ft = "lua",
        config = require("plugins.cmp.lazydev").config,
        dependencies = {
          { "Bilal2453/luvit-meta", lazy = true }, -- libuv
          { "LelouchHe/xmake-luals-addon", lazy = true }, -- xmake
        },
      },
      { -- Dap
        "rcarriga/cmp-dap",
        config = require("plugins.cmp.cmp-dap").config,
      },
      { -- LuaSnip
        "L3MON4D3/LuaSnip",
        version = "*",
        build = not vim.g.is_windows and "make install_jsregexp" or nil,
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
        dependencies = {
          "rafamadriz/friendly-snippets",
          "saadparwaiz1/cmp_luasnip",
        },
      },
      { -- Path
        name = "cmp-async-path",
        url = "https://codeberg.org/FelipeLema/cmp-async-path",
      },
      { -- Auto pair
        "windwp/nvim-autopairs",
        config = function()
          require("plugins.cmp.nvim-autopairs").config()
        end,
      },
    },
  },

  -- Commandline
  {
    "hrsh7th/cmp-cmdline",
    keys = { ":", "/", "?" },
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-buffer", -- Buffer
      { -- Path
        name = "cmp-async-path",
        url = "https://codeberg.org/FelipeLema/cmp-async-path",
      },
    },
    opts = require("plugins.cmp.cmdline").options,
    config = function(_, opts)
      local cmp = require "cmp"
      vim.tbl_map(function(val)
        cmp.setup.cmdline(val.type, val)
      end, opts)
    end,
  },
}
