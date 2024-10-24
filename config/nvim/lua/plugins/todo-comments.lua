return {
  "folke/todo-comments.nvim",
  keys = {
    { "<Space>ft", "<CMD>TodoQuickFix<CR>", desc = "Todo" },
  },
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kevinhwang91/nvim-bqf",
  },
  opts = {},
}
