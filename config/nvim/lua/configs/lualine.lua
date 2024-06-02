local M = {}
local icons = require "modules.icons"

local opts = {
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 3000,
      tabline = 3000,
      winbar = 3000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      function()
        local tab_id = vim.api.nvim_tabpage_get_number(0)
        return "[" .. tab_id .. "]"
      end,
      "filename",
      "aerial",
    },
    lualine_c = {
      "%=",
      function()
        return require("lsp-progress").progress()
      end,
    },
    lualine_x = {
      "diagnostics",
      function()
        local names = {}
        for _, server in pairs(vim.lsp.get_active_clients { bufnr = 0 }) do
          table.insert(names, server.name)
        end
        local name = table.concat(names, " ")
        return name == "" and "" or icons.ActiveLSP .. "  " .. name
      end,
    },
    lualine_y = {
      { "branch", icon = icons.Git },
    },
    lualine_z = { "location", "progress" },
  },
}

M.config = function()
  require("lualine").setup(opts)
end

return M
