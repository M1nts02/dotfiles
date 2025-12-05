return {
  "folke/flash.nvim",
  keys = {
    {
      "<C-f>",
      mode = { "n", "v" },
      function()
        require("flash").jump { search = { forward = true, wrap = false, multi_window = false } }
      end,
      desc = "Jump Forward",
    },
    {
      "<C-b>",
      mode = { "n", "v" },
      function()
        require("flash").jump { search = { forward = false, wrap = false, multi_window = false } }
      end,
      desc = "Jump Backward",
    },
    {
      "r",
      mode = { "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Treesitter Flash",
    },
  },
  opts = {
    modes = { char = { enabled = false } },
  },
}
