local utils = require "modules.utils"
local executable = utils.executable

return {
  "mikavilpas/yazi.nvim",
  enable = executable "yazi",
  keys = {
    { "<Space>e", "<CMD>Yazi<CR>", desc = "Yazi" },
  },
  opts = { open_for_directories = true },
  dependencies = {
    "folke/snacks.nvim",
  },
}
