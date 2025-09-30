return {
  "mikavilpas/yazi.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<Space>e",
      function()
        require("yazi").yazi()
      end,
      desc = "Yazi",
      mode = { "n" },
    },
  },
  config = function()
    require("yazi").setup {
      open_for_directories = true,
    }
  end,
}
