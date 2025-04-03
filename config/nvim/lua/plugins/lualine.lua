local function config()
  require("lualine").setup {
    options = {
      icons_enabled = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "dashboard", "NeogitStatus", "oil", "qf" },
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 500,
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
      },
      lualine_c = {
        "%=",
      },
      lualine_x = {
        "diagnostics",
        {
          "lsp_status",
          icon = "",
          symbols = {
            spinner = { "", "󰪞", "󰪟", "󰪠", "󰪢", "󰪣", "󰪤", "󰪥" },
          },
        },
      },
      lualine_y = {
        { "branch", icon = "󰊢 " },
        "encoding",
      },
      lualine_z = { "location", "progress" },
    },
  }
end

return {
  "nvim-lualine/lualine.nvim",
  event = { "BufRead", "BufNewFile" },
  config = config,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
