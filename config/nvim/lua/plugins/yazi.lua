local M = {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim", lazy = true },
}

M.keys = {
  {
    "<Space>e",
    function()
      require("yazi").yazi()
    end,
    desc = "Yazi",
    mode = { "n" },
  },
}

M.opts = { open_for_directories = true }

return M
