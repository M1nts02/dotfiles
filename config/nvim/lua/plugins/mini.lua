local keys = {
  {
    "<Space>E",
    function()
      require("mini.files").open()
    end,
    desc = "Mini Files",
  },
  {
    "<Space>tp",
    function()
      vim.g.minipairs_disable = not vim.g.minipairs_disable
      if vim.g.minipairs_disable == true then
        vim.notify "Autopairs Disabled"
      else
        vim.notify "Autopairs Enabled"
      end
    end,
    desc = "Autopairs",
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
}

return {
  "echasnovski/mini.nvim",
  version = "*",
  event = { "VeryLazy" },
  keys = keys,
  init = function()
    vim.g.minipairs_disable = true
  end,
  config = function()
    require("mini.files").setup()
    require("mini.pairs").setup()
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
