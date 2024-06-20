local cmp = require "cmp"
local icons = {
  Namespace = "󰌗",
  Text = "󰉿",
  Method = "󰆧",
  Constructor = "",
  Field = "󰜢",
  Variable = "󰀫",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  EnumMember = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈚",
  Reference = "󰈇",
  Folder = "󰉋",
  Constant = "󰏿",
  Struct = "󰙅",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰊄",
  Table = "",
  Object = "󰅩",
  Tag = "",
  Array = "[]",
  Boolean = "",
  Number = "",
  Null = "󰟢",
  String = "󰉿",
  Calendar = "",
  Watch = "󰥔",
  Package = "",
  Copilot = "",
  Codeium = "",
  TabNine = "",
  Function = "󰊕",
}

local function get_cmp_status()
  if vim.g.cmp_disable == false and vim.b.cmp_disable == false then
    return true
  else
    return false
  end
end

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
  snippet = {},
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
      elseif vim.snippet.active { direction = 1 } then
        vim.snippet.jump(1)
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
      elseif vim.snippet.active { direction = -1 } then
        vim.snippet.jump(-1)
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
    { name = "nvim_lsp" },
    { name = "snippets", max_item_count = 10 },
    { name = "path" },
    { name = "buffer" },
    { name = "fittencode", group_index = 1 },
    { name = "lazydev", group_index = 2 },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(_, item)
      local icon = icons[item.kind] or icons.Text
      item.menu = "    (" .. item.kind .. ")"
      item.kind = " " .. icon .. " "
      return item
    end,
  },
}

-- Enable cmp
vim.api.nvim_create_user_command("CmpEnable", function()
  vim.g.cmp_disable = false
  vim.b.cmp_disable = false
  vim.notify "Cmp enabled"
end, {
  desc = "Enable cmp",
})

-- Disable cmp
vim.api.nvim_create_user_command("CmpDisable", function()
  vim.g.cmp_disable = true
  vim.b.cmp_disable = true
  vim.notify "Cmp disabled"
end, {
  desc = "Cmp disabled",
})
