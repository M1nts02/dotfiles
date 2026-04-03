return {
  "NeogitOrg/neogit",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neogit").setup {
      graph_style = "kitty",
      commit_editor = { staged_diff_split_kind = "auto", spell_check = false },
    }
    Utils.setmap {
      { { "n" }, "<Leader>g", "<CMD>Neogit<CR>", desc = "Neogit" },
    }
  end,
}
