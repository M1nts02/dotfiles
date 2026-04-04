local cmp = require "blink-cmp"
local lspkind = require "lspkind"

cmp.setup {
  enabled = function()
    local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
    if buftype == "prompt" then return false end
    return vim.g.cmp_enable
  end,
  keymap = {
    ["<C-c>"] = { "hide", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
    ["<C-n>"] = { "select_next", "snippet_forward", "show", "fallback" },
    ["<C-p>"] = { "select_prev", "snippet_backward", "show", "fallback" },
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<C-u>"] = { "show_documentation", "scroll_documentation_up", "fallback" },
    ["<C-d>"] = { "show_documentation", "scroll_documentation_down", "fallback" },
  },
  appearance = { nerd_font_variant = "normal", kind_icons = lspkind.symbol_map },
  sources = {
    default = { "lazydev", "lsp", "path", "buffer" },
    min_keyword_length = 3,
    providers = { snippets = { score_offset = 4 },
      lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
    },
  },
  snippets = { preset = "luasnip" },
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
        padding = { 0, 1 },
        gap = 1,
        columns = { { "kind_icon" }, { "label", gap = 1 }, { "kind" } },
        components = {
          kind = {
            ellipsis = false,
            width = { fill = true },
            text = function(ctx) return "(" .. ctx.kind .. ")" end,
          },
        },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
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
  signature = { enabled = false, window = { border = "rounded" } },
  cmdline = { enabled = false },
}
