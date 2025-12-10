return {
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    keys = {
      { "<Space>gn", "<CMD>Neogit<CR>", desc = "Neogit" },
      { "<Space>gd", "<CMD>DiffviewOpen<CR>", desc = "Diff" },
    },
    opts = {
      integrations = { fzf_lua = true },
      graph_style = "kitty",
      commit_editor = { staged_diff_split_kind = "auto", spell_check = false },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    version = "*",
    event = { "VeryLazy" },
    opts = {},
  },
}
