local utils = require "modules.utils"
local executable = utils.executable

return {
  "rolv-apneseth/tfm.nvim",
  enable = executable "yazi",
  keys = {
    {
      "<Space>y",
      function()
        require("tfm").open()
      end,
      desc = "Yazi",
    },
  },
  opts = {},
}
