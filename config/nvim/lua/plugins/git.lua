return {
  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    version = "*",
    cmd = { "Gitsigns" },
    keys = {
      {
        "<Space>gb",
        "<CMD>Gitsigns toggle_current_line_blame<CR>",
        desc = "Line blame",
      },
      {
        "<Space>gh",
        "<CMD>Gitsigns preview_hunk<CR>",
        desc = "Preview hunk",
      },
      {
        "<Space>gt",
        "<CMD>Gitsigns toggle_signs<CR>",
        desc = "Toggle gitsigns",
      },
    },
    event = { "BufRead", "BufNewFile" },
    opts = { signcolumn = true },
  },

  -- Neogit
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
    },
  },
}
