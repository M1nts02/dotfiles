local keys = {
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
  end,
}
