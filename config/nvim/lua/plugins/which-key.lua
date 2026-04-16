return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      preset = "helix",
      notify = false,
      triggers = { { "<auto>", mode = "n" } },
      icons = { rules = false, group = "" },
      win = { border = "rounded", title_pos = "left" },
    }

    require("which-key").add {
      { "gr", group = "LSP+" },
      { "grx", group = "Codelens" },
      { "<Leader>a", group = "Ai+" },
      { "<Leader>f", group = "Find+" },
      { "<Leader>g", group = "Git+" },
      { "<Leader>o", group = "Options+" },
    }
  end,
}
