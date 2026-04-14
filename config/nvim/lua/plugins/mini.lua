return {
  "nvim-mini/mini.nvim",
  config = function()
    require("mini.icons").setup()
    require("mini.pairs").setup()
    require("mini.comment").setup()
    require("mini.icons").setup()

    -- Toggle auto pairs
    vim.api.nvim_create_user_command("AutoPairsToggle", function()
      vim.g.minipairs_disable = not vim.g.minipairs_disable
      Cache.update { g = { minipairs_disable = vim.g.minipairs_disable } }
    end, { desc = "Toggle auto pairs" })
  end,
}
