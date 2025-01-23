return {
  "M1nts02/akane.nvim",
  lazy = false,
  config = function()
    require("akane").setup { transparent = vim.g.transparent }
    if vim.g.dark == true then
      vim.cmd "colorscheme akane-dark"
    else
      vim.cmd "colorscheme akane-light"
    end
  end,
}
