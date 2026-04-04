-- Open cache file
vim.api.nvim_create_user_command("CustomOpen", function()
  vim.cmd("e " .. CachePath)
end, {
  desc = "Open cache file",
})

-- Toggle Wrap
vim.api.nvim_create_user_command("WrapToggle", function()
  local s = not vim.opt.wrap:get()
  vim.opt.wrap = s
  local i = s == true and "true" or "false"
  vim.cmd("tabdo windo lua vim.opt.wrap = " .. i)
  Cache.update { opt = { wrap = s } }
end, {
  desc = "Toggle wrap",
})

-- Toggle inlay hints
vim.api.nvim_create_user_command("InlayHints", function()
  local s = not vim.g.inlay_hints
  vim.g.inlay_hints = s
  local enable = s and "true" or "false"
  vim.cmd("tabdo windo lua vim.lsp.inlay_hint.enable(" .. enable .. ", { bufnr = 0 })")
  Cache.update { g = { inlay_hints = s } }
end, {
  desc = "Toggle inlay hints",
})

-- Toggle virtual text
vim.api.nvim_create_user_command("VirtualText", function()
  vim.g.dianostic_virtualtext = not vim.g.dianostic_virtualtext
  if vim.g.dianostic_virtualtext == true then
    vim.diagnostic.config { virtual_lines = { current_line = true } }
  else
    vim.diagnostic.config { virtual_lines = false }
  end
  Cache.update { g = { dianostic_virtualtext = vim.g.dianostic_virtualtext } }
end, {
  desc = "Toggle virtual text",
})

-- Toggle format
vim.api.nvim_create_user_command("FormatToggle", function()
  vim.g.enable_autoformat = not vim.g.enable_autoformat
  Cache.update { g = { enable_autoformat = vim.g.enable_autoformat } }
end, {
  desc = "Toggle format",
})

-- Toggle dark mode
vim.api.nvim_create_user_command("DarkMode", function(opt)
  local mode = vim.split(opt.args, " ", { plain = true })[1]

  if mode == nil or mode == "" then
    Color.dark_mode(not vim.g.dark)
  else
    Color.dark_mode(mode == "true")
  end
end, {
  desc = "Toggle dark mode",
  nargs = "*",
  complete = function()
    return { "true", "false" }
  end,
})

-- Toggle auto completion
vim.api.nvim_create_user_command("BlinkCmpToggle", function()
  vim.g.cmp_enable = not vim.g.cmp_enable
  Cache.update { g = { cmp_enable = vim.g.cmp_enable } }
end, {
  desc = "Toggle auto completion",
})

