local M = {
  "mikavilpas/yazi.nvim",
  cmd = "Yazi",
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
