return {
  "NeogitOrg/neogit",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neogit").setup { commit_editor = { staged_diff_split_kind = "auto", spell_check = false } }
    Utils.setmap { { { "n" }, "<Space>gn", "<CMD>Neogit<CR>", { desc = "Neogit" } } }
  end,
}
