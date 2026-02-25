local M = { "j-morano/buffer_manager.nvim" }

M.dependencies = { "nvim-lua/plenary.nvim" }

M.keys = {
  {
    "<Space>b",
    function()
      require("buffer_manager.ui").toggle_quick_menu()
    end,
    desc = "Buffers",
  },
}

M.opt = {}

return M
