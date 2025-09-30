return {
  "M1nts02/nvim-template",
  event = "VeryLazy",
  config = function()
    require("nvim-template").setup {
      git_info = true,
    }
  end,
}
