local utils = require "modules.utils"
local executable = utils.executable

return {
  -- Nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    keys = {
      {
        "<Space>e",
        "<CMD>NvimTreeFindFileToggle<CR>",
        desc = "File browser",
      },
    },
    opts = function()
      local HEIGHT_RATIO = 0.7
      local WIDTH_RATIO = 0.6

      return {
        view = {
          float = {
            enable = true,
            open_win_config = function()
              local screen_w = vim.opt.columns:get()
              local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
              local window_w = screen_w * WIDTH_RATIO
              local window_h = screen_h * HEIGHT_RATIO
              local window_w_int = math.floor(window_w)
              local window_h_int = math.floor(window_h)
              local center_x = (screen_w - window_w) / 2
              local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
              return {
                border = "rounded",
                relative = "editor",
                row = center_y,
                col = center_x,
                width = window_w_int,
                height = window_h_int,
              }
            end,
          },
          width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
          end,
        },
      }
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "rolv-apneseth/tfm.nvim",
    enable = executable "yazi",
    keys = {
      {
        "<Space>E",
        function()
          require("tfm").open()
        end,
        desc = "tfm",
      },
    },
    opts = {},
  },
}
