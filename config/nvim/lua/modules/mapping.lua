local map = {
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
}

for _, m in ipairs(map) do
  if m[4] == nil then
    m[4] = { noremap = true }
  end
  vim.keymap.set(m[1], m[2], m[3], m[4])
end
