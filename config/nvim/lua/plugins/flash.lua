return {
  "folke/flash.nvim",
  keys = {
    {
      "<C-f>",
      mode = { "n", "x", "o", "v" },
      function()
        require("flash").jump { search = { forward = true, wrap = false, multi_window = false } }
      end,
      desc = "Jump forward",
    },
    {
      "<C-b>",
      mode = { "n", "x", "o", "v" },
      function()
        require("flash").jump { search = { forward = false, wrap = false, multi_window = false } }
      end,
      desc = "Jump backward",
    },
  },
  opts = {
    modes = {
      search = { enabled = false },
      char = { enabled = false },
    },
  },
}
