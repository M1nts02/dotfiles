-- Open cache file
vim.api.nvim_create_user_command("CustomOpen", "e " .. CachePath, { desc = "Open cache file" })

-- Toggle dark mode
vim.api.nvim_create_user_command("DarkMode", function()
  Color.dark_mode(not vim.g.dark)
end, { desc = "Toggle dark mode" })

-- Toggle Wrap
vim.api.nvim_create_user_command("WrapToggle", function()
  local s = not vim.opt.wrap:get()
  Cache.update { opt = { wrap = s } }
  local i = s == true and "true" or "false"
  vim.cmd("tabdo windo lua vim.opt.wrap = " .. i)
  vim.notify("Wrap is " .. (s and "enabled" or "disabled"))
end, { desc = "Toggle wrap" })

-- Toggle LSP info
vim.api.nvim_create_user_command("LspVirtualText", function()
  Cache.update { g = { lsp_info = not vim.g.lsp_info } }
  if vim.g.lsp_info == true then
    vim.lsp.codelens.enable(true)
    vim.cmd "tabdo windo lua vim.lsp.inlay_hint.enable(true, { bufnr = 0 })"
    if vim.g.dianostic_virtualtext == 1 then
      vim.diagnostic.config { virtual_lines = true, float = { border = "rounded" } }
    elseif vim.g.dianostic_virtualtext == 2 then
      vim.diagnostic.config { virtual_lines = { current_line = true }, float = { border = "rounded" } }
    end
  else
    vim.lsp.codelens.enable(false)
    vim.cmd "tabdo windo lua vim.lsp.inlay_hint.enable(false, { bufnr = 0 })"
    vim.diagnostic.config { virtual_lines = false, float = { border = "rounded" } }
  end
end, { desc = "LSP Info" })
