return {
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    keys = { { "<Space>n", "<CMD>Neogit<CR>", desc = "Neogit" } },
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
