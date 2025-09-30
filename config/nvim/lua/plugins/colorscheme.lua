return {
  "M1nts02/akane.nvim",
  lazy = false,
  config = function()
    require("akane").setup { transparent = vim.g.transparent }
    -- Theme
    if vim.g.dark == true then
      vim.cmd("colorscheme " .. vim.g.dark_theme)
    else
      vim.cmd("colorscheme " .. vim.g.light_theme)
    end
  end,
}
