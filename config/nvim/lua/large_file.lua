local large_file_size = 20 * 1024 * 1024

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  callback = function(ev)
    local size = vim.fn.getfsize(ev.file)
    if size > large_file_size or size == -2 then
      vim.bo.swapfile = false
      vim.bo.bufhidden = "unload"
      vim.bo.undolevels = -1
      vim.bo.undofile = false

      vim.cmd "syntax off"
      vim.cmd "filetype off"

      vim.wo.relativenumber = false
      vim.wo.cursorline = false
      vim.wo.cursorcolumn = false
    end
  end,
})
