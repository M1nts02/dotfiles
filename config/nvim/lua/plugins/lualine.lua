local M = {
  "nvim-lualine/lualine.nvim",
  event = { "VeryLazy" },
  dependencies = { "nvim-tree/nvim-web-devicons", "miroshQa/debugmaster.nvim" },
}

function M.config()
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
        {
          "tabs",
          mode = 2,
          tabs_color = {
            active = { fg = "#008b8b" },
            inactive = { fg = "#8c8fa1" },
          },
        },
      },
      lualine_c = {
        "%=",
      },
      lualine_x = {
        {
          function()
            return "%S"
          end,
          color = { fg = "#399ee6", gui = "bold" },
        },
        {
          function()
            return vim.fn.reg_recording() ~= "" and "● " .. vim.fn.reg_recording() or ""
          end,
          color = { fg = "#ffa54f", gui = "bold" },
        },
        {
          function()
            if vim.v.hlsearch == 0 then
              return ""
            end
            local ok, result = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 100 })
            if not ok or result.total == 0 then
              return ""
            end
            return string.format("[%d/%d]", result.current, result.total)
          end,
          color = { fg = "#399ee6", gui = "bold" },
        },
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

return M
