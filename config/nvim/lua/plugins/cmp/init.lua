return {
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = require("plugins.cmp.cmp").config,
    dependencies = {
      "hrsh7th/cmp-path", -- Support path
      "hrsh7th/cmp-nvim-lsp", -- Support LSP
      "hrsh7th/cmp-buffer", -- Buffer
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-calc", -- math calculation
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
          { "justinsgithub/wezterm-types", lazy = true }, -- wezterm
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
        dependencies = { "rafamadriz/friendly-snippets" },
      },
    },
  },

  -- Commandline
  {
    "hrsh7th/cmp-cmdline",
    keys = { ":", "/", "?" },
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-path", -- Path
      "hrsh7th/cmp-buffer", -- Buffer
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
