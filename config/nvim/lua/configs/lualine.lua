local M = {}

local opts = {
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "dashboard" },
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
        for _, server in pairs(vim.lsp.get_clients { bufnr = 0 }) do
          table.insert(names, server.name)
        end
        local name = table.concat(names, " ")
        return name == "" and "" or " " .. " " .. name
      end,
    },
    lualine_y = {
      { "branch", icon = "󰊢 " },
    },
    lualine_z = { "location", "progress" },
  },
}

function M.config()
  require("lualine").setup(opts)
end

return M
