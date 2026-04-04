return {
  "saghen/blink.cmp",
  version = "v1.10.1",
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "L3MON4D3/LuaSnip",
      build = function(plugin) if not isWindows then vim.cmd("!(cd  " .. plugin.path .. " && make install_jsregexp)") end end,
      config = function() require("plugins.cmp.luasnip") end,
    },
    {
      "onsails/lspkind.nvim",
      config = function() require("lspkind").init { mode = "symbol_text" } end,
    },
  },
  config = function() require("plugins.cmp.blink_cmp") end,
}
