local opts = {
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
}

local function config()
  local lspkind = require "lspkind"
  lspkind.setup(opts)
  local cmp = require "cmp"
  local conf = cmp.get_config()
  conf.formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(_, item)
      local kind = item.kind
      local icon = lspkind.symbol_map[kind] or kind
      item.menu = "    (" .. kind .. ")"
      item.kind = " " .. icon .. " "
      return item
    end,
  }
  cmp.setup(conf)
end

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "onsails/lspkind.nvim",
      config = config,
    },
  },
}
