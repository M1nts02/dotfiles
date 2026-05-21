return {
  "neovim-treesitter/nvim-treesitter",
  enabled = Utils.executable "tree-sitter",
  build = ":TSUpdate",
  dependencies = { "neovim-treesitter/treesitter-parser-registry" },
  config = function()
    local TS = require "nvim-treesitter"
    TS.setup {}
    TS.install { "bash", "c", "cpp", "csv", "editorconfig", "git_config", "json", "lua", "luadoc", "markdown", "python", "sql", "toml", "vim", "vimdoc", "yaml", "zig", "zsh" }
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldmethod = "expr"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
}
