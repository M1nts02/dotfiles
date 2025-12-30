local M = {
  "M1nts02/akane.nvim",
}

function M.config()
  require("akane").setup { transparent = vim.g.transparent }
  Utils.set_colorscheme()
end

return M
