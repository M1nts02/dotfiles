Utils.setmap {
  {
    "n", "<Leader>gg",
    function()
      vim.cmd "tabnew"
      local buf = vim.api.nvim_get_current_buf()
      vim.fn.jobstart(vim.g.dark and "gitui -t catppuccin-mocha.ron" or "gitui -t catppuccin-latte.ron", {
        term = true,
        on_exit = function(_, code)
          if code ~= 0 then return end
          vim.schedule(function() pcall(vim.api.nvim_buf_delete, buf, { force = true }) end)
        end,
      })
      vim.api.nvim_buf_set_name(buf, "term://gitui")
      vim.cmd "startinsert"
    end,
    { desc = "Gitui" },
    enabled = Utils.executable "gitui",
  },
}
