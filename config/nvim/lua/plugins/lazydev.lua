local opts = {
  library = {
    { path = "luvit-meta/library", words = { "vim%.uv" } },
    { path = "wezterm-types", mods = { "wezterm" } },
    { path = "xmake-luals-addon/library", files = { "xmake.lua" } },
    { path = "${3rd}/love2d/library" },
  },
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua",
      config = function()
        require("lazydev").setup(opts)
        local cmp = require "cmp"
        local conf = cmp.get_config()
        table.insert(conf.sources, { name = "lazydev", group_index = 0 })
        cmp.setup(conf)
      end,
      dependencies = {
        { "Bilal2453/luvit-meta", lazy = true }, -- libuv
        { "justinsgithub/wezterm-types", lazy = true }, -- wezterm
        { "LelouchHe/xmake-luals-addon", lazy = true }, -- xmake
      },
    },
  },
}
