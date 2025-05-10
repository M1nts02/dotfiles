local os_name = jit.os
vim.g.is_mac = os_name:find "OSX" ~= nil
vim.g.is_linux = os_name:find "Linux" ~= nil
vim.g.is_windows = os_name:find "Windows" ~= nil

vim.g.lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
vim.g.confpath = vim.fn.stdpath "config"

require "modules.load_custom" -- Custom options
require "modules.options" -- Options
require("modules.cache").load() -- Save options

local utils = require "modules.utils"
local setmap = utils.setmap
local executable = utils.executable
local deps = require "modules.deps"
local pack, add, now, later = deps.pack, deps.add, deps.now, deps.later

-- Don't load shada
local shada = vim.o.shada
vim.o.shada = ""

----------- Lazy-load ----------
later(function()
  -- Load shada
  vim.o.shada = shada
  pcall(vim.cmd.rshada, { bang = true })
  -- Load mapping
  require "modules.mapping"
end)

----------- Plugins ------------
--- auto pair
later(function()
  require("mini.pairs").setup()
end)

--- file browser
pack({
  source = "mikavilpas/yazi.nvim",
  depends = { "folke/snacks.nvim", "nvim-lua/plenary.nvim" },
}, {
  enable = executable "yazi",
  now = function()
    local yazi = require "yazi"
    yazi.setup {
      open_for_directories = true,
      floating_window_scaling_factor = 1.0,
      yazi_floating_window_border = "none",
    }
    setmap { { { "n" }, "<Space>e", "<CMD>Yazi<CR>", { noremap = true, desc = "Yazi" } } }
  end,
})

--- which key
pack({
  source = "folke/which-key.nvim",
}, {
  later = function()
    require "plugins.which-key"
  end,
})

--- colorscheme
pack({
  source = "M1nts02/akane.nvim",
}, {
  now = function()
    require("akane").setup { transparent = vim.g.transparent }
    -- Theme
    if vim.g.dark == true then
      vim.cmd("colorscheme " .. vim.g.dark_theme)
    else
      vim.cmd("colorscheme " .. vim.g.light_theme)
    end
  end,
})

--- statusline
pack({
  source = "nvim-lualine/lualine.nvim",
  depends = { "nvim-tree/nvim-web-devicons" },
}, {
  later = function()
    require "plugins.lualine"
  end,
})

--- dashboard
pack({
  source = "nvimdev/dashboard-nvim",
  depends = { "nvim-tree/nvim-web-devicons" },
}, {
  now = function()
    require "plugins.dashboard"
  end,
})

--- Installer
pack({
  source = "mason-org/mason.nvim",
}, {
  later = function()
    require("mason").setup {
      PATH = "skip",
      max_concurrent_installers = 10,
      ui = {
        border = "rounded",
        backdrop = 100,
        keymaps = {
          toggle_package_expand = "<CR>",
          install_package = "i",
          update_package = "u",
          check_package_version = "c",
          update_all_packages = "U",
          check_outdated_packages = "C",
          uninstall_package = "X",
          cancel_installation = "<C-c>",
          apply_language_filter = "<C-f>",
        },
      },
    }
  end,
})

--- Menu
pack({
  source = "M1nts02/nvim-menu",
}, {
  later = function()
    require "plugins.menu"
  end,
})

--- termplate
pack({
  source = "M1nts02/nvim-template",
  checkout = "dev",
}, {
  later = function()
    require("nvim-template").setup {
      git_info = true,
    }
  end,
})

--- treesitter
pack({
  source = "nvim-treesitter/nvim-treesitter",
  hooks = {
    post_checkout = function()
      vim.cmd "TSUpdate"
    end,
  },
}, {
  enabled = executable { "gcc", "clang", "zig", "cc", "cl" },
  now = function()
    vim.api.nvim_create_autocmd("BufReadPost", {
      pattern = { "*.kdl", "*.md", "*.ron", "*.toml", "*.yaml" },
      command = "TSBufEnable highlight",
    })
  end,
  later = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "c", "lua", "markdown", "query", "ron", "vim", "vimdoc" },
      sync_install = false,
      auto_install = true,
      highlight = { enable = false, additional_vim_regex_highlighting = false },
    }
  end,
})

--- cursor jump
pack({
  source = "folke/flash.nvim",
}, {
  later = function()
    local flash = require "flash"
    flash.setup {
      modes = {
        search = { enabled = false },
        char = { enabled = false },
      },
    }
    setmap {
      {
        { "n", "x", "o", "v" },
        "<C-f>",
        function()
          flash.jump { search = { forward = true, wrap = false, multi_window = false } }
        end,
        { noremap = true, desc = "Jump forward" },
      },
      {
        { "n", "x", "o", "v" },
        "<C-b>",
        function()
          flash.jump { search = { forward = false, wrap = false, multi_window = false } }
        end,
        { noremap = true, desc = "Jump backward" },
      },
    }
  end,
})

--- a list ui
pack({
  source = "folke/trouble.nvim",
}, {
  later = function()
    require "plugins.trouble"
  end,
})

--- terminal
pack({
  source = "akinsho/toggleterm.nvim",
}, {
  later = function()
    require("toggleterm").setup {
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      autochdir = false,
      start_in_insert = true,
      direction = "float",
      close_on_exit = true,
      auto_scroll = true,
      float_opts = { border = "curved" },
      winbar = { enabled = false },
    }
  end,
})

--- search
pack({
  source = "nvim-telescope/telescope.nvim",
  depends = {
    "natecraddock/workspaces.nvim",
    "olimorris/persisted.nvim",
    "jonarrien/telescope-cmdline.nvim",
    "nvim-lua/plenary.nvim",
  },
}, {
  later = function()
    require "plugins.telescope"
  end,
})

--- git
later(function()
  require("mini.git").setup()
end)

--- formatter
pack({
  source = "stevearc/conform.nvim",
}, {
  now = function()
    if vim.g.disable_autoformat == true then
      vim.g.zig_fmt_autosave = 0
    end
  end,
  later = function()
    require("conform").setup {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        gdscript = { "gdformat" },
        javascript = { "biome" },
        json = { "jq" },
        lua = { "stylua" },
        markdown = { "mdformat" },
        python = { "ruff_format", "isort", "black", stop_after_first = true },
        rust = { "rustfmt", lsp_format = "fallback" },
        typescript = { "biome" },
        yaml = { "yamlfmt" },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat == true then
          return
        end
        return { timeout_ms = 1000, lsp_format = "fallback" }
      end,
    }

    -- Toggle auto format
    vim.api.nvim_create_user_command("AutoformatToggle", function(args)
      if vim.g.disable_autoformat == true then
        vim.g.disable_autoformat = false
        vim.g.zig_fmt_autosave = 1
        vim.notify "Autoformat enabled"
      else
        vim.g.disable_autoformat = true
        vim.g.zig_fmt_autosave = 0
        vim.notify "Autoformat disabled"
      end
    end, {
      desc = "Toggle autoformat",
      bang = true,
    })
  end,
})

--- snippets
pack({
  source = "L3MON4D3/LuaSnip",
  depends = {
    "rafamadriz/friendly-snippets",
    "nvim-telescope/telescope.nvim",
    "chrisgrieser/nvim-scissors",
  },
}, {
  build = not vim.g.is_windows and { "make", "install_jsregexp" } or nil,
  later = function()
    require("luasnip.loaders.from_vscode").lazy_load { paths = { vim.g.confpath .. "/snippets" } }
    require("scissors").setup {
      snippetDir = vim.g.confpath .. "/snippets",
      jsonFormatter = executable "jq" and "jq" or "none",
      backdrop = {
        enabled = true,
        blend = 100,
      },
    }
  end,
})

--- completion
pack({
  source = "saghen/blink.cmp",
  depends = {
    "L3MON4D3/LuaSnip",
    "onsails/lspkind.nvim",
  },
  checkout = "v1.2.0",
}, {
  later = function()
    require "plugins.blink_cmp"
  end,
})

--- icons
pack({
  source = "onsails/lspkind.nvim",
}, {
  later = function()
    require("lspkind").init {
      mode = "symbol_text",
      symbol_map = {
        FittenCode = "",
        Codeium = "",
        Copilot = "",
      },
    }
  end,
})

--- lsp
pack({
  source = "neovim/nvim-lspconfig",
  depends = {
    "folke/lazydev.nvim",
    "saghen/blink.cmp",
    "b0o/schemastore.nvim",
    "LelouchHe/xmake-luals-addon",
  },
}, {
  later = function()
    require "plugins.lspconfig"
    require("lazydev").setup {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "xmake-luals-addon/library", files = { "xmake.lua" } },
      },
      enabled = function(root_dir)
        return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
      end,
    }
  end,
})

--- debug
pack({
  source = "mfussenegger/nvim-dap",
  depends = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
}, {
  later = function()
    require("plugins.dap.dap").config()
    require "plugins.dap.dap-ui"
  end,
})
