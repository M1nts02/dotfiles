if vim.g.neovide then
  local setmap = Utils.setmap

  vim.o.guifont = "Maple Mono NF CN:h14"
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_progress_bar_enabled = false
  vim.g.neovide_cursor_vfx_mode = "pixiedust"

  local map = {
    -- Tab
    { { "n", "i", "v", "t" }, "<D-t>", "<CMD>tabnew<CR>" },
    { { "n", "i", "v", "t" }, "<D-1>", "<CMD>tabnext 1<CR>" },
    { { "n", "i", "v", "t" }, "<D-2>", "<CMD>tabnext 2<CR>" },
    { { "n", "i", "v", "t" }, "<D-3>", "<CMD>tabnext 3<CR>" },
    { { "n", "i", "v", "t" }, "<D-4>", "<CMD>tabnext 4<CR>" },
    { { "n", "i", "v", "t" }, "<D-5>", "<CMD>tabnext 5<CR>" },
    { { "n", "i", "v", "t" }, "<D-6>", "<CMD>tabnext 6<CR>" },
    { { "n", "i", "v", "t" }, "<D-7>", "<CMD>tabnext 7<CR>" },
    { { "n", "i", "v", "t" }, "<D-8>", "<CMD>tabnext 8<CR>" },
    { { "n", "i", "v", "t" }, "<D-9>", "<CMD>tablast<CR>" },
    { { "n", "i", "v", "t" }, "<D-0>", "<CMD>tabfirst<CR>" },
    { { "n", "i", "v", "t" }, "<D-w>", "<CMD>q<CR>" },
    { { "v" }, "<D-x>", "d" },
    { { "v" }, "<D-c>", "y" },
    { { "v", "n" }, "<D-v>", "p" },
    { { "v", "n" }, "<D-f>", "/" },
    { { "n" }, "<D-d>", "<CMD>vsplit<CR>" },
    { { "n" }, "<D-S-d>", "<CMD>split<CR>" },
    { { "n" }, "<D-Up>", "<C-w>k" },
    { { "n" }, "<D-Down>", "<C-w>j" },
    { { "n" }, "<D-Left>", "<C-w>h" },
    { { "n" }, "<D-Right>", "<C-w>l" },
    { { "n" }, "<D-S-Up>", "<C-w>K" },
    { { "n" }, "<D-S-Down>", "<C-w>J" },
    { { "n" }, "<D-S-Left>", "<C-w>H" },
    { { "n" }, "<D-S-Right>", "<C-w>L" },
    { { "n" }, "<D-S-x>", "<CMD>Lazy<CR>" },
    { { "n" }, "<D-S-p>", ":" },
  }

  setmap(map)
end
