local M = { "M1nts02/akane.nvim" }

-- Toggle dark mode
vim.api.nvim_create_user_command("DarkMode", function()
  vim.g.dark = not vim.g.dark
  Cache.update { g = { dark = vim.g.dark } }

  if vim.g.dark == true then
    vim.cmd("colorscheme " .. vim.g.dark_theme)
  else
    vim.cmd("colorscheme " .. vim.g.light_theme)
  end
end, {
  desc = "Toggle dark mode",
})

function M.config()
  require("akane").setup { transparent = vim.g.transparent }
  if vim.g.dark == true then
    vim.cmd("colorscheme " .. vim.g.dark_theme)
  else
    vim.cmd("colorscheme " .. vim.g.light_theme)
  end
end

return M
