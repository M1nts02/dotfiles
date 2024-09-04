return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "garymjr/nvim-snippets",
      config = function()
        require("snippets").setup {
          friendly_snippets = true,
        }
      end,
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
  },
}
