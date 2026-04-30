return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local NvimTree = require "nvim-tree"
    NvimTree.setup {
      update_focused_file = { enable = true },
    }
    Utils.setmap {
      { "n", "<Leader>e", "<CMD>NvimTreeToggle<CR>", { desc = "Nvim Tree" } },
      { "n", "<D-b>", "<CMD>NvimTreeToggle<CR>", { desc = "Nvim Tree" }, enabled = isMac and isGui },
    }
  end,
}
