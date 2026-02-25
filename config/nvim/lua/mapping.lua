local setmap = Utils.setmap

local map = {
  { { "n" }, "<Space>q", "<CMD>q<CR>", { desc = "Quit" } },
  -- Clear highlights on search when pressing <Esc> in normal mode
  { { "n" }, "<Esc>", "<CMD>nohlsearch<CR>" },
  -- Tab
  { { "n" }, "<C-w>e", "<CMD>tabnew<CR>", { desc = "New Tab" } },
  { { "n" }, "<C-w>1", "<CMD>tabnext 1<CR>", { desc = "Goto Tab 1" } },
  { { "n" }, "<C-w>2", "<CMD>tabnext 2<CR>", { desc = "Goto Tab 2" } },
  { { "n" }, "<C-w>3", "<CMD>tabnext 3<CR>", { desc = "Goto Tab 3" } },
  { { "n" }, "<C-w>4", "<CMD>tabnext 4<CR>", { desc = "Goto Tab 4" } },
  { { "n" }, "<C-w>5", "<CMD>tabnext 5<CR>", { desc = "Goto Tab 5" } },
  { { "n" }, "<C-w>6", "<CMD>tabnext 6<CR>", { desc = "Goto Tab 6" } },
  { { "n" }, "<C-w>7", "<CMD>tabnext 7<CR>", { desc = "Goto Tab 7" } },
  { { "n" }, "<C-w>8", "<CMD>tabnext 8<CR>", { desc = "Goto Tab 8" } },
  { { "n" }, "<C-w>9", "<CMD>tabnext 9<CR>", { desc = "Goto Tab 9" } },
  -- Terminal
  -- { { "n" }, "<Space>t", "<CMD>belowright split | terminal<CR><Insert>", { desc = "Terminal Split" } },
  -- { { "n" }, "<Space>T", "<CMD>belowright vsplit | terminal<CR><Insert>", { desc = "Terminal VSplit" } },
  -- LSP
  { { "n" }, "grn", vim.lsp.buf.rename, { desc = "Rename" } },
  { { "n" }, "gra", vim.lsp.buf.code_action, { desc = "Code Action" } },
  -- Indenting
  { { "v" }, "<", "<gv" },
  { { "v" }, ">", ">gv" },
  -- Change number
  { { "v" }, "<C-a>", "<C-a>gv" },
  { { "v" }, "<C-x>", "<C-x>gv" },
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
    { "i", "s" },
    "<C-s>",
    function()
      vim.lsp.buf.signature_help { border = "rounded" }
    end,
  },
  { { "n" }, "<Space>m", "<CMD>Settings<CR>", { desc = "Menu" } },
}

setmap(map)
