local map = {
  -- Paste
  { { "n" }, "gp", '"+p' },
  { { "n" }, "gP", '"+P' },
  -- Move
  { { "i", "c" }, "<M-0>", "<Home>" },
  { { "i", "c" }, "<M-a>", "<Home>" },
  { { "i", "c" }, "<M-4>", "<End>" },
  { { "i", "c" }, "<M-e>", "<End>" },
  { { "i", "c" }, "<M-u>", "<PageUp>" },
  { { "i", "c" }, "<M-d>", "<PageDown>" },
  { { "i", "c" }, "<M-l>", "<Right>" },
  { { "i", "c" }, "<M-j>", "<Down>" },
  { { "i", "c" }, "<M-h>", "<Left>" },
  { { "i", "c" }, "<M-k>", "<Up>" },
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
