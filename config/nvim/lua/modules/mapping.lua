local map = {
  -- Clear highlights on search when pressing <Esc> in normal mode
  { { "n" }, "<Esc>", "<CMD>nohlsearch<CR>" },
  -- Paste
  { { "n" }, "gp", '"+p' },
  { { "n" }, "gP", '"+P' },
  -- Completion
  { { "i" }, "<C-l>", "<C-x><C-f>" },
  -- Indenting
  { { "v" }, "<", "<gv" },
  { { "v" }, ">", ">gv" },
  -- Change number
  { { "v" }, "<C-a>", "<C-a>gv" },
  { { "v" }, "<C-x>", "<C-x>gv" },
  -- Yank
  { { "n" }, "gy", '"+y' },
  { { "n" }, "gY", '"+Y' },
  { { "v" }, "gy", '"+y' },
  { { "v" }, "gY", '"+Y' },
  -- LSP
  {
    { "n" },
    "K",
    function()
      vim.lsp.buf.hover {
        title = "  hover ",
        border = "rounded",
      }
    end,
  },
  {
    { "i" },
    "<C-s>",
    function()
      vim.lsp.buf.signature_help { border = "rounded" }
    end,
  },
}

for _, m in ipairs(map) do
  if m[4] == nil then
    m[4] = { noremap = true }
  end
  vim.keymap.set(m[1], m[2], m[3], m[4])
end
