return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      preset = "helix",
      notify = false,
      triggers = { { "<auto>", mode = "n" } },
      icons = { rules = false, group = "" },
      win = { border = "rounded", title_pos = "left" },
      plugins = {
        spelling = { enabled = true },
      },
    }

    require("which-key").add {
      { "gr",        group = "LSP+" },
      { "<Leader>f", group = "Find+" },
      { "<Leader>a", group = "Ai+" },
    }
  end,
}
