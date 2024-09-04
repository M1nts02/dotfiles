return {
  "stevearc/aerial.nvim",
  cmd = { "AerialToggle", "AerialOpen", "AerialNavToggle", "AerialNavOpen" },
  keys = { { "<Space>ls", "<CMD>Telescope aerial<CR>", desc = "Symbols" } },
  config = function()
    require("aerial").setup { backends = { "markdown", "treesitter", "lsp", "asciidoc", "man" } }
    require("telescope").load_extension "aerial"
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}
