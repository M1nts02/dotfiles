return {
  {
    "lewis6991/gitsigns.nvim",
    version = "*",
    event = { "BufRead", "BufNewFile" },
    cmd = { "Gitsigns" },
    keys = {
      { "<Space>gb", "<CMD>Gitsigns toggle_current_line_blame<CR>", desc = "Line blame" },
      { "<Space>gh", "<CMD>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
      { "<Space>gt", "<CMD>Gitsigns toggle_signs<CR>", desc = "Toggle gitsigns" },
    },
    opts = {
      signcolumn = true,
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    keys = { { "<Space>gn", "<CMD>Neogit<CR>", desc = "Neogit" } },
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
