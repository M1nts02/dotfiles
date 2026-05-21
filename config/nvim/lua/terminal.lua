-- AutoInsertMode
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd "startinsert"
    end
  end,
})

-- Terminal
vim.api.nvim_create_user_command("Term", function()
  vim.cmd "tabnew"
  local buf = vim.api.nvim_get_current_buf()
  vim.fn.jobstart(vim.o.shell, {
    term = true,
    on_exit = function(_, code)
      if code ~= 0 then
        return
      end
      vim.schedule(function()
        pcall(vim.api.nvim_buf_delete, buf, { force = true })
      end)
    end,
  })
  vim.cmd "startinsert"

  local current_buf = vim.api.nvim_get_current_buf()

  local function quit_terminal()
    vim.api.nvim_buf_delete(current_buf, { force = true })
  end
  Utils.setmap {
    { "nvit", "<C-/>", quit_terminal, { desc = "Close Terminal", buf = current_buf } },
    { "nvit", "<D-j>", quit_terminal, { desc = "Close Terminal", buf = current_buf }, enabled = isMac and isGui },
  }
end, {})

Utils.setmap {
  -- terminal
  { "nit", "<C-/>", "<CMD>Term<CR>", { desc = "Terminal" } },
  { "nit", "<D-j>", "<CMD>Term<CR>", { desc = "Terminal" }, enabled = isMac and isGui },
}
