return {
  "luukvbaal/statuscol.nvim",
  config = function()
    require("statuscol").setup {}
  end,
  dependencies = { "lewis6991/gitsigns.nvim" },
}
