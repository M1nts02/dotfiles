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
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            { path = "xmake-luals-addon/library", files = { "xmake.lua" } },
          },
          enabled = function(root_dir)
            return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
          end,
        },
        dependencies = { "LelouchHe/xmake-luals-addon" },
      },
    },
  },
}
