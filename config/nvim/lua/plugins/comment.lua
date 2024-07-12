return {
  -- Comment
  {
    "numToStr/Comment.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = {},
  },

  -- TODO
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoQuickFix", "TodoLocList" },
    opts = {},
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
