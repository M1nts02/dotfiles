-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function() vim.highlight.on_yank() end,
})

-- Set highlight
vim.api.nvim_create_autocmd("ColorScheme", { callback = function() Color.set_hl() end })

-- Lsp
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Lsp Info",
  callback = function()
    if vim.g.lsp_info == true then
      vim.lsp.codelens.enable(true)
      if vim.g.dianostic_virtualtext == 1 then
        vim.diagnostic.config { virtual_lines = true, float = { border = "rounded" } }
      elseif vim.g.dianostic_virtualtext == 2 then
        vim.diagnostic.config { virtual_lines = { current_line = true }, float = { border = "rounded" } }
      end
    else
      vim.diagnostic.config { virtual_lines = false, float = { border = "rounded" } }
    end
  end,
})

-- Large file
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

-- AutoInsertMode
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd "startinsert"
    end
  end,
})
