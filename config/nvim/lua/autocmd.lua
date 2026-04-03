-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Format
vim.g.zig_fmt_autosave = 0
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Format",
  callback = function(args)
    if vim.g.enable_autoformat ~= false then
      vim.lsp.buf.format({ bufnr = args.buf })
    end
  end,
})
