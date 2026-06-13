return {
  "olimorris/codecompanion.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local cc = require "codecompanion"
    vim.g.allowed_in_yolo_mode = true
    cc.setup {
      interactions = {
        chat = { adapter = "kimi_cli" },
        inline = { adapter = "kimi_cli" },
        cmd = { adapter = "kimi_cli" },
        background = { adapter = "kimi_cli" },
      },
    }
    Utils.setmap {
      { "n", "<Leader>ac", cc.toggle, { desc = "Chat" } },
      { "n", "<Leader>aa", cc.actions, { desc = "Actions" } },
    }
  end,
}
