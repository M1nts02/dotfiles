return {
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    keys = {
      { "<Space>gn", "<CMD>Neogit<CR>", desc = "Neogit" },
      { "<Space>gd", "<CMD>DiffviewOpen<CR>", desc = "Diff" },
    },
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "sindrets/diffview.nvim",
        config = function()
          local actions = require "diffview.actions"

          require("diffview").setup {
            keymaps = {
              view = { { "n", "q", "<CMD>DiffviewClose<CR>" } },
              file_panel = {
                { "n", "q", "<CMD>DiffviewClose<CR>" },
                {
                  "n",
                  "<C-y>",
                  actions.select_entry,
                  { desc = "Open the diff for the selected entry" },
                },
              },
            },
          }
        end,
      },
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    version = "*",
    event = { "VeryLazy" },
    opts = {},
  },
}
