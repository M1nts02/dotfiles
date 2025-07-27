local utils = require "modules.utils"

return {
  "chrisgrieser/nvim-scissors",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function()
    require("scissors").setup {
      snippetDir = vim.g.confpath .. "/snippets",
      jsonFormatter = utils.executable "jq" and "jq" or "none",
      backdrop = {
        enabled = true,
        blend = 100,
      },
    }
  end,
}
