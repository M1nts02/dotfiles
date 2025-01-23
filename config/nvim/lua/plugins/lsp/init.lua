return {
  {
    "neovim/nvim-lspconfig",
    version = "*",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "plugins.lsp.servers"
      if vim.g.is_mac then
        require "plugins.lsp.servers_mac"
      end
    end,
    dependencies = {
      "b0o/schemastore.nvim",
    },
  },
  {
    "stevearc/aerial.nvim",
    cmd = { "AerialToggle", "AerialOpen", "AerialNavToggle", "AerialNavOpen" },
    keys = { { "<Space>ls", "<CMD>Telescope aerial<CR>", desc = "Symbols" } },
    config = function()
      require("aerial").setup {
        backends = { "markdown", "treesitter", "lsp", "asciidoc", "man" },
        layout = { min_width = 20 },
      }
      require("telescope").load_extension "aerial"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
