local file_detail = false

local function get_options()
  return {
    float = {
      max_height = math.floor(vim.opt.lines:get() * 0.7),
      max_width = math.floor(vim.opt.columns:get() * 0.6),
    },
    keymaps = {
      ["q"] = "actions.close",
      ["<BS>"] = "actions.parent",
      ["gd"] = {
        desc = "Toggle file detail view",
        callback = function()
          file_detail = not file_detail
          if file_detail then
            require("oil").set_columns { "icon", "permissions", "size", "mtime" }
          else
            require("oil").set_columns { "icon" }
          end
        end,
      },
    },
  }
end

return {
  "stevearc/oil.nvim",
  version = "*",
  cmd = "Oil",
  keys = {
    {
      "<Space>o",
      function()
        local oil = require "oil"
        local opts = get_options()
        local h = math.floor(vim.opt.lines:get() * 0.7)
        local w = math.floor(vim.opt.columns:get() * 0.6)
        h = h < 15 and 0 or h
        w = w < 40 and 0 or w
        opts.float.max_width = w
        opts.float.max_height = h
        oil.setup(opts)
        oil.open_float()
      end,
      desc = "Files",
    },
  },
  opts = function()
    return get_options()
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
