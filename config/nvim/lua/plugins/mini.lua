local keys = {
  {
    "<Space>E",
    function()
      require("mini.files").open()
    end,
    desc = "Mini Files",
  },
  {
    "<Space>tc",
    function()
      require("mini.hipatterns").enable(0)
    end,
    desc = "Enable Color",
  },
  {
    "<Space>tC",
    function()
      require("mini.hipatterns").disable(0)
    end,
    desc = "Disable Color",
  },
  {
    "<Space>gd",
    function()
      require("mini.diff").toggle_overlay(0)
    end,
    desc = "Diff",
  },
}

return {
  "echasnovski/mini.nvim",
  version = "*",
  event = { "BufRead", "BufNewFile" },
  keys = keys,
  config = function()
    require("mini.pairs").setup()
    require("mini.files").setup()
    require("mini.diff").setup {
      delay = { text_change = 1000 },
      mappings = {
        apply = "",
        reset = "",
        textobject = "",
        goto_first = "",
        goto_prev = "",
        goto_next = "",
        goto_last = "",
      },
    }
    require("mini.hipatterns").setup {
      highlighters = {
        fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
        hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
      },
      delay = {
        text_change = 1000,
        scroll = 1000,
      },
    }
  end,
}
