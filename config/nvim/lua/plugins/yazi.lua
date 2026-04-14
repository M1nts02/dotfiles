return {
  "mikavilpas/yazi.nvim",
  enabled = Utils.executable("yazi"),
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local yazi = require("yazi")
    yazi.setup({ open_for_directories = false, floating_window_scaling_factor = 0.8 })
    Utils.setmap { { { "n" }, "<Space>e", function() yazi.yazi() end, { desc = "Yazi" } } }
  end,
}
