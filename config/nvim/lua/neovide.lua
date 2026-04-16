vim.g.neovide_floating_shadow = false
vim.g.neovide_scroll_animation_length = 0

Utils.setmap {
  { "nv", "<D-c>", '"+y', { desc = "Copy" }, enabled = isMac },
  { "nv", "<D-x>", '"+d', { desc = "Cut" }, enabled = isMac },
  { "nv", "<D-v>", '"+p', { desc = "Paste" }, enabled = isMac },
  { "ic", "<D-v>", "<C-r>+", { desc = "Paste" }, enabled = isMac },
  {
    "t",
    "<D-v>",
    function()
      local clipboard_content = vim.fn.getreg "+"
      vim.api.nvim_chan_send(vim.bo.channel, clipboard_content)
    end,
    { desc = "Paste" },
    enabled = isMac,
  },
  { "n", "<D-a>", "ggVG", { desc = "Select all" }, enabled = isMac },
  { "i", "<D-a>", "<Esc>ggVG", { desc = "Select all" }, enabled = isMac },
  { "n", "<D-w>", "<CMD>q<CR>", { desc = "Quit" }, enabled = isMac },

  { "n", "<D-d>", "<CMD>belowright vsplit<CR>", { desc = "Vertical Split" }, enabled = isMac },
  { "n", "<D-S-d>", "<CMD>belowright split<CR>", { desc = "Split" }, enabled = isMac },

  { "nxit", "<D-Left>", "<CMD>wincmd h<CR>", { desc = "Focus left" }, enabled = isMac },
  { "nxit", "<D-Right>", "<CMD>wincmd l<CR>", { desc = "Focus right" }, enabled = isMac },
  { "nxit", "<D-Up>", "<CMD>wincmd k<CR>", { desc = "Focus up" }, enabled = isMac },
  { "nxit", "<D-Down>", "<CMD>wincmd j<CR>", { desc = "Focus down" }, enabled = isMac },

  -- Tab
  { "n", "<D-t>", "<CMD>tabnew<CR>", { desc = "New Tab" }, enabled = isMac },
  { "n", "<D-1>", "<CMD>tabnext 1<CR>", { desc = "Goto Tab 1" }, enabled = isMac },
  { "n", "<D-2>", "<CMD>tabnext 2<CR>", { desc = "Goto Tab 2" }, enabled = isMac },
  { "n", "<D-3>", "<CMD>tabnext 3<CR>", { desc = "Goto Tab 3" }, enabled = isMac },
  { "n", "<D-4>", "<CMD>tabnext 4<CR>", { desc = "Goto Tab 4" }, enabled = isMac },
  { "n", "<D-5>", "<CMD>tabnext 5<CR>", { desc = "Goto Tab 5" }, enabled = isMac },
  { "n", "<D-6>", "<CMD>tabnext 6<CR>", { desc = "Goto Tab 6" }, enabled = isMac },
  { "n", "<D-7>", "<CMD>tabnext 7<CR>", { desc = "Goto Tab 7" }, enabled = isMac },
  { "n", "<D-8>", "<CMD>tabnext 8<CR>", { desc = "Goto Tab 8" }, enabled = isMac },
  { "n", "<D-9>", "<CMD>tabnext 9<CR>", { desc = "Goto Tab 9" }, enabled = isMac },
}
