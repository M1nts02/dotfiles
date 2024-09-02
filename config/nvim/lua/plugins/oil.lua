local detail = false

return {
  {
    "stevearc/oil.nvim",
    keys = { { "<Space>e", "<CMD>Oil --float<CR>", desc = "Files" } },
    opts = {
      float = {
        max_height = math.floor(vim.opt.lines:get() * 0.8),
        max_width = math.floor(vim.opt.columns:get() * 0.8),
      },
      keymaps = {
        ["q"] = "actions.close",
        ["<BS>"] = "actions.parent",
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns { "icon", "permissions", "size", "mtime" }
            else
              require("oil").set_columns { "icon" }
            end
          end,
        },
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
