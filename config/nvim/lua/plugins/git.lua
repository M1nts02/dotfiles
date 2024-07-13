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
        "<Space>gd",
        "<CMD>Gitsigns diffthis<CR>",
        desc = "Diff current buffer",
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
}
