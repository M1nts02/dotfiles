local function dark_mode(mode)
  if mode == nil then
    vim.g.dark = not vim.g.dark
  else
    vim.g.dark = mode
  end

  Cache.update { g = { dark = vim.g.dark } }
  if vim.g.dark == true then
    vim.cmd.colorscheme(vim.g.dark_theme)
  else
    vim.cmd.colorscheme(vim.g.light_theme)
  end
end

-- Toggle dark mode
vim.api.nvim_create_user_command("DarkMode", function(opt)
  local mode = vim.split(opt.args, " ", { plain = true })[1]

  if mode == nil or mode == "" then
    dark_mode(not vim.g.dark)
  else
    dark_mode(mode == "true")
  end
end, {
  desc = "Toggle dark mode",
  nargs = "*",
  complete = function()
    return { "true", "false" }
  end,
})

dark_mode(vim.g.dark)
