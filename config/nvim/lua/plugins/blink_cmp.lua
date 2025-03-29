local utils = require "modules.utils"
local executable = utils.executable

local function get_cmp_status()
  if vim.g.cmp_disable == false and vim.b.cmp_disable ~= true then
    return true
  else
    return false
  end
end

return {
  "saghen/blink.cmp",
  version = "*",
  event = { "InsertEnter", "CmdLineEnter" },
  keys = { "/", "?", ":" },
  config = function()
    local cmp = require "blink-cmp"
    local luasnip = require "luasnip"
    cmp.setup {
      enabled = function()
        local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
        if buftype == "prompt" then
          return false
        end
        return get_cmp_status()
      end,
      keymap = {
        ["<C-c>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-n>"] = { "select_next", "snippet_forward", "show" },
        ["<C-p>"] = { "select_prev", "snippet_backward", "show" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<C-u>"] = { "show_documentation", "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "show_documentation", "scroll_documentation_down", "fallback" },
      },
      snippets = {
        preset = "luasnip",
        expand = function(snippet)
          luasnip.lsp_expand(snippet)
        end,
        active = function(filter)
          if filter and filter.direction then
            return luasnip.jumpable(filter.direction)
          end
          return luasnip.in_snippet()
        end,
        jump = function(direction)
          luasnip.jump(direction)
        end,
      },
      appearance = {
        nerd_font_variant = "normal",
        kind_icons = require("lspkind").symbol_map,
      },
      sources = {
        default = { "lsp", "path", "buffer", "snippets", "fittencode" },
        min_keyword_length = 3,
        providers = {
          fittencode = {
            name = "fittencode",
            module = "fittencode.sources.blink",
          },
        },
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        trigger = {
          show_on_keyword = true,
          show_on_trigger_character = true,
          show_on_insert_on_trigger_character = false,
          show_on_accept_on_trigger_character = true,
        },
        list = { selection = { preselect = false, auto_insert = true } },
        menu = {
          enabled = true,
          min_width = 15,
          max_height = 10,
          border = "rounded",
          winblend = 0,
          scrollbar = false,
          direction_priority = { "s", "n" },
          auto_show = true,
          draw = {
            align_to = "label",
            padding = 1,
            gap = 1,
            columns = {
              { "kind_icon" },
              { "label", gap = 1 },
              { "kind" },
            },
            components = {
              kind_icon = {
                ellipsis = true,
                text = function(ctx)
                  return ctx.icon_gap .. ctx.kind_icon .. ctx.icon_gap
                end,
              },
              label = {
                width = { fill = true, max = 60 },
                text = function(ctx)
                  return ctx.label .. ctx.label_detail
                end,
              },
              kind = {
                ellipsis = false,
                width = { fill = true },
                text = function(ctx)
                  return "(" .. ctx.kind .. ")"
                end,
                highlight = "BlinkCmpLabelMatch",
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          update_delay_ms = 200,
          treesitter_highlighting = true,
          window = {
            min_width = 10,
            max_width = 60,
            max_height = 20,
            border = "rounded",
            winblend = 0,
            scrollbar = true,
            direction_priority = {
              menu_north = { "e", "w", "n", "s" },
              menu_south = { "e", "w", "s", "n" },
            },
          },
        },
        ghost_text = { enabled = false },
      },
      signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      },
      cmdline = {
        keymap = {
          ["<C-y>"] = { "select_and_accept", "fallback" },
          ["<C-c>"] = { "hide", "fallback" },
          ["<Tab>"] = { "select_next", "show", "fallback" },
          ["<S-Tab>"] = { "select_prev", "show", "fallback" },
          ["<Up>"] = { "fallback" },
          ["<Down>"] = { "fallback" },
        },
        sources = function()
          local type = vim.fn.getcmdtype()
          if type == "/" or type == "?" then
            return { "buffer" }
          elseif type == ":" then
            return { "cmdline", "path" }
          elseif type == "@" then
            return { "path", "buffer" }
          end
          return {}
        end,
        completion = {
          list = { selection = { preselect = false, auto_insert = true } },
          menu = {
            auto_show = true,
            draw = {
              columns = {
                { "kind_icon" },
                { "label", gap = 1 },
              },
            },
          },
        },
      },
    }
  end,
  dependencies = {
    { -- LuaSnip
      "L3MON4D3/LuaSnip",
      version = "*",
      build = not vim.g.is_windows and "make install_jsregexp" or nil,
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load { paths = { vim.g.confpath .. "/snippets" } }
      end,
      dependencies = {
        "rafamadriz/friendly-snippets",
        {
          "chrisgrieser/nvim-scissors",
          dependencies = "nvim-telescope/telescope.nvim",
          opts = {
            snippetDir = vim.g.confpath .. "/snippets",
            jsonFormatter = executable "jq" and "jq" or "none",
            backdrop = {
              enabled = true,
              blend = 100,
            },
          },
        },
      },
    },
    { -- Auto pair
      "windwp/nvim-autopairs",
      opts = {
        fast_wrap = {},
        disable_filetype = { "TelescopePrompt", "vim" },
      },
      config = function(_, opts)
        require("nvim-autopairs").setup(opts)
        if vim.g.autopairs == true then
          require("nvim-autopairs").enable()
        else
          require("nvim-autopairs").disable()
        end
      end,
    },
    { -- FittenCode
      "luozhiya/fittencode.nvim",
      cmd = "Fitten",
      config = function()
        require("fittencode").setup {
          use_default_keymaps = false,
          source_completion = { engine = "blink" },
          completion_mode = "source",
        }
      end,
    },
    {
      "onsails/lspkind.nvim",
      config = function()
        require("lspkind").init {
          mode = "symbol_text",
          symbol_map = {
            FittenCode = "",
            Codeium = "",
            Copilot = "",
          },
        }
      end,
    },
    {
      "saghen/blink.compat",
      version = "*",
      lazy = true,
      opts = {},
    },
  },
  opts_extend = { "sources.default" },
}
