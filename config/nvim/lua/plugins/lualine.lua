return {
  "nvim-lualine/lualine.nvim",
  event = { "VeryLazy" },
  dependencies = { "nvim-tree/nvim-web-devicons", "miroshQa/debugmaster.nvim" },
  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "dashboard", "NeogitStatus", "oil", "qf", "toggleterm" },
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
        lualine_a = {
          "mode",
        },
        lualine_b = {
          function()
            return require("debugmaster.debug.mode").is_active() and "[DEBUG]" or ""
          end,
          function()
            local tab_id = vim.api.nvim_tabpage_get_number(0)
            local tab_num = #(vim.api.nvim_list_tabpages())

            if tab_num < 2 then
              return ""
            end

            return tab_id .. "/" .. tab_num
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
  end,
}
