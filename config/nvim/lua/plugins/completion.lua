local cache = require "modules.cache"
local get_status = cache.get_status

local function get_cmp_status()
  if vim.g.cmp_disable == false and vim.b.cmp_disable == false then
    return true
  else
    return false
  end
end

local function config()
  local cmp = require "cmp"
  local luasnip = require "luasnip"
  local lspkind = require "lspkind"
  cmp.setup {
    enabled = function()
      local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
      if buftype == "prompt" then
        return false
      end
      return get_cmp_status()
    end,
    completion = {
      keyword_length = 3,
    },
    window = {
      completion = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,Search:None",
        scrollbar = false,
        border = "rounded",
      },
      documentation = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,Search:None",
        border = "rounded",
        scrollbar = false,
      },
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<Esc>"] = cmp.mapping.close(),
      ["<C-c>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<S-CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<Up>"] = cmp.mapping.select_prev_item(),
      ["<Down>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<C-n>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        -- elseif vim.snippet.active { direction = 1 } then
        --   vim.snippet.jump(1)
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif get_cmp_status() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<C-p>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        -- elseif vim.snippet.active { direction = -1 } then
        --   vim.snippet.jump(-1)
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif get_cmp_status() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      -- { name = "snippets", max_item_count = 10 },
      { name = "path" },
      { name = "buffer" },
      { name = "fittencode", group_index = 1 },
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(_, item)
        local kind = item.kind
        local icon = lspkind.symbol_map[kind] or kind
        item.menu = "    (" .. kind .. ")"
        item.kind = " " .. icon .. " "
        return item
      end,
    },
  }
end

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = config,
  dependencies = {
    "hrsh7th/cmp-path", -- Support path
    "hrsh7th/cmp-nvim-lsp", -- Support LSP
    "hrsh7th/cmp-buffer", -- Buffer
    { -- Icons
      "onsails/lspkind.nvim",
      opts = {
        symbol_map = {
          Array = "[]",
          Boolean = "",
          Calendar = "",
          Codeium = "",
          Copilot = "",
          EnumMember = "",
          FittenCode = "",
          Namespace = "󰌗",
          Null = "󰟢",
          Number = "",
          Object = "󰅩",
          Package = "",
          String = "󰉿",
          Table = "",
          TabNine = "",
          Tag = "",
          Watch = "󰥔",
        },
      },
    },
    { -- AI
      "luozhiya/fittencode.nvim",
      cmd = "Fitten",
      opts = {
        completion_mode = "source",
      },
      config = function(_, opts)
        require("fittencode").setup(opts)
        if get_status().g.fittencode then
          vim.cmd "Fitten enable_completions"
        else
          vim.cmd "Fitten disable_completions"
        end
      end,
    },
    { -- snippet
      "saadparwaiz1/cmp_luasnip",
      dependencies = {
        "rafamadriz/friendly-snippets",
        {
          "L3MON4D3/LuaSnip",
          version = "*",
          build = (not vim.g.is_windows) and "make install_jsregexp" or nil,
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
          end,
        },
      },
    },
  },
}
