local M = {
  "mikavilpas/yazi.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },
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
