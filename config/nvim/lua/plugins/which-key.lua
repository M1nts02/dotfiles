local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
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
    { "gr", group = "LSP+" },
    { "<Space>f", group = "Find+" },
    { "<Space>a", group = "Ai+" },
  }
end

return M
