return {
  "NeogitOrg/neogit",
  cmd = { "Neogit" },
  keys = {
    {
      "<Space>gn",
      "<CMD>Neogit<CR>",
      desc = "Neogit",
    },
  },
  opts = {
    commit_editor = {
      staged_diff_split_kind = "vsplit",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
}
