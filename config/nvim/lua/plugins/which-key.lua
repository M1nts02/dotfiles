return {
  "folke/which-key.nvim",
  config = function()
    local which_key = require "which-key"
    which_key.setup {
      preset = "helix",
      notify = false,
      triggers = { { "<auto>", mode = "n" } },
      icons = { rules = false, group = "" },
      win = { border = "rounded", title_pos = "left" },
    }

    which_key.add {
      { "gr", group = "LSP+" },
      { "grx", group = "Codelens" },
      { "<Leader>a", group = "Ai+" },
      { "<Leader>f", group = "Find+" },
      { "<Leader>g", group = "Git+" },
      { "<Leader>o", group = "Options+" },
      { "<Leader>p", group = "Plugins+" },
      { "<Leader>w", function() which_key.show { keys = "<c-w>", loop = true } end, desc = "Window" },
    }
  end,
}
