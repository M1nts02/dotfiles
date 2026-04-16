return {
  "folke/snacks.nvim",
  config = function()
    local Snacks = require "snacks"
    Snacks.setup {
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      terminal = { win = { style = "terminal" } },
      statuscolumn = { enabled = false },
      explorer = { replace_netrw = false },
      indent = { enabled = false },
      input = { enabled = false },
      picker = { enabled = false },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      words = { enabled = false },
    }

    Utils.setmap {
      { "nit", "<C-\\>", Snacks.terminal.toggle, { desc = "Terminal" } },
      { "nit", "<D-j>", Snacks.terminal.toggle, { desc = "Terminal" }, enabled = isMac and vim.g.neovide },
      { "n", "<leader>e", Snacks.explorer.reveal, { desc = "Explorer" } },
      { "n", "<D-b>", Snacks.explorer.reveal, { desc = "Explorer" }, enabled = isMac and vim.g.neovide },
      {
        "n",
        "<Leader>gg",
        function()
          Snacks.terminal(
            vim.g.dark and "gitui -t catppuccin-mocha.ron" or "gitui -t catppuccin-latte.ron",
            { win = { position = "float", border = true, backdrop = 100, height = 0.9, width = 0.9, zindex = 50 } }
          )
        end,
        { desc = "Gitui" },
        enabled = Utils.executable "gitui",
      },
    }
  end,
}
