return {
  {
    "lewis6991/gitsigns.nvim",
    version = "*",
    event = { "BufRead", "BufNewFile" },
    cmd = { "Gitsigns" },
    keys = require("plugins.git.gitsigns").keys,
    opts = require("plugins.git.gitsigns").opts,
  },
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    keys = require("plugins.git.neogit").keys,
    opts = require("plugins.git.neogit").opts,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  },
}
