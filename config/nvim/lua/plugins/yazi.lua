local M = {
  "mikavilpas/yazi.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
}

M.keys = { { "<Space>y", "<CMD>Yazi<CR>", desc = "Yazi", mode = { "n" } } }

M.opts = {}

return M
