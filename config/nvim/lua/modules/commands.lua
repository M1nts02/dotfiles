vim.api.nvim_create_user_command("NumberToggle", function()
  vim.cmd "tabdo windo set number!"
end, {
  desc = "Toggle number",
})

vim.api.nvim_create_user_command("RelativenumberToggle", function()
  vim.cmd "tabdo windo set relativenumber!"
end, {
  desc = "Toggle relativenumber",
})

vim.api.nvim_create_user_command("StatuslineToggle", function()
  local ls = vim.o.laststatus
  vim.o.laststatus = ls == 0 and 3 or 0
end, {
  desc = "Toggle status line",
})

vim.api.nvim_create_user_command("WrapToggle", function()
  vim.cmd "tabdo windo set wrap!"
end, {
  desc = "Toggle wrap",
})
