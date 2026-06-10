return {
  "olimorris/codecompanion.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local cc = require "codecompanion"
    cc.setup {}
    Utils.setmap {
      { "n", "<Leader>ac", cc.toggle, { desc = "Chat" } },
      { "n", "<Leader>aa", cc.actions, { desc = "Actions" } },
    }
  end,
}
