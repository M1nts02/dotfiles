return {
  "saghen/blink.cmp",
  version = "v1.10.2",
  dependencies = {
    "rafamadriz/friendly-snippets",
    {
      "L3MON4D3/LuaSnip",
      build = not isWindows and "make install_jsregexp" or nil,
      config = function() require "plugins.cmp.luasnip" end,
    },
  },
  config = function() require "plugins.cmp.blink_cmp" end,
}
