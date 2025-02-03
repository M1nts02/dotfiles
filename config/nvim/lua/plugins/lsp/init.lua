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
}
