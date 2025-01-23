local utils = require "modules.utils"
local executable = utils.executable

return {
  "mikavilpas/yazi.nvim",
  enable = executable "yazi",
  keys = {
    { "<Space>e", "<CMD>Yazi<CR>", desc = "Yazi" },
  },
  opts = {
    floating_window_scaling_factor = 0.9,
  },
}
