-- TODO: error with zig
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "garymjr/nvim-snippets",
      enabled = false,
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
