local utils = require "modules.utils"
local executable = utils.executable

return {
  "mikavilpas/yazi.nvim",
  enable = executable "yazi",
  init = function()
    vim.g.loaded_netrwPlugin = 1
  end,
  keys = {
    { "<Space>e", "<CMD>Yazi<CR>", desc = "Yazi" },
  },
  opts = {
    open_for_directories = true,
    floating_window_scaling_factor = 1.0,
  },
  dependencies = {
    "folke/snacks.nvim",
  },
}
