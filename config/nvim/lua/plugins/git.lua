return {
  {
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
      "nvim-lualine/lualine.nvim",
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewClose",
      "DiffviewFileHistory",
      "DiffviewFocusFiles",
      "DiffviewLog",
      "DiffviewOpen",
      "DiffviewRefresh",
      "DiffviewToggleFiles",
    },
    keys = {
      { "<Space>gd", "<CMD>DiffviewOpen<CR>", desc = "Diff Open" },
      { "<Space>gD", "<CMD>DiffviewClose<CR>", desc = "Diff Close" },
    },
  },
}
