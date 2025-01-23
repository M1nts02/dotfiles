return {
  {
    "lewis6991/gitsigns.nvim",
    version = "*",
    event = { "BufRead", "BufNewFile" },
    cmd = { "Gitsigns" },
    keys = {
      {
        "<Space>ga",
        "<CMD>Gitsigns attach<CR>",
        desc = "Gitsigns attach",
      },
      {
        "<Space>gd",
        "<CMD>Gitsigns detach<CR>",
        desc = "Gitsigns detach",
      },
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
    },
    opts = {
      auto_attach = false,
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
}
