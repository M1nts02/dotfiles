local utils = require "modules.utils"
local setmap = utils.setmap

local map = {
  -- Clear highlights on search when pressing <Esc> in normal mode
  { { "n" }, "<Esc>", "<CMD>nohlsearch<CR>" },
  -- Paste
  { { "n" }, "gp", '"+p' },
  { { "n" }, "gP", '"+P' },
  -- Tab
  { { "n" }, "<C-w>e", "<CMD>tabnew<CR>" },
  { { "n" }, "<C-w>1", "<CMD>tabnext 1<CR>" },
  { { "n" }, "<C-w>2", "<CMD>tabnext 2<CR>" },
  { { "n" }, "<C-w>3", "<CMD>tabnext 3<CR>" },
  { { "n" }, "<C-w>4", "<CMD>tabnext 4<CR>" },
  { { "n" }, "<C-w>5", "<CMD>tabnext 5<CR>" },
  { { "n" }, "<C-w>6", "<CMD>tabnext 6<CR>" },
  { { "n" }, "<C-w>7", "<CMD>tabnext 7<CR>" },
  { { "n" }, "<C-w>8", "<CMD>tabnext 8<CR>" },
  { { "n" }, "<C-w>9", "<CMD>tablast<CR>" },
  { { "n" }, "<C-w>0", "<CMD>tabfirst<CR>" },
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

setmap(map)
