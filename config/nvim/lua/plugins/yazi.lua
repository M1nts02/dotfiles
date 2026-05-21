return {
  "mikavilpas/yazi.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local Yazi = require "yazi"
    Yazi.setup { open_for_directories = true }
    Utils.setmap { { "n", "<Leader>e", Yazi.yazi, { desc = "Yazi" } } }
  end,
}
