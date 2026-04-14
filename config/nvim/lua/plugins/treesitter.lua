return {
  "romus204/tree-sitter-manager.nvim",
  enabled = Utils.executable("tree-sitter"),
  config = function()
    require("tree-sitter-manager").setup()
  end
}
