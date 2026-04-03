return {
  "mikavilpas/yazi.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("yazi").setup {
      open_for_directories = true,
      floating_window_scaling_factor = 0.8,
    }
    Utils.setmap {
      { { "n" }, "<Space>e", function() require("yazi").yazi() end, { desc = "Yazi" } },
    }
  end,
}
