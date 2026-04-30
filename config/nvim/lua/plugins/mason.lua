return {
  "mason-org/mason.nvim",
  config = function()
    require("mason").setup { ui = { border = "rounded", backdrop = 100 } }
    Utils.setmap { { "n", "<Leader>m", "<CMD>Mason<CR>", { desc = "Mason" } } }
  end,
}
