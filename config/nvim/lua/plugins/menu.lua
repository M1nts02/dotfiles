local M = { "M1nts02/nvim-menu" }

M.keys = {
  {
    "<Space>m",
    function()
      local menu = require "nvim-menu"
      menu.open "Menu"
    end,
    desc = "Menu",
  },
}

function M.config()
  local menu = require "nvim-menu"
  menu.add("Menu", {
    config = {
      -- format = "${FLAG} [${KEY}] ${DESC}",
      -- flag_len = 1,
      quit = false,
      foreign_keys = false,
      position = "CC",
      type = "menu",
    },
    items = {
      {
        {
          key = "p",
          desc = "Auto pairs",
          flag = function()
            return not vim.g.minipairs_disable
          end,
        },
        function()
          vim.g.minipairs_disable = not vim.g.minipairs_disable
          Cache.update { g = { minipairs_disable = vim.g.minipairs_disable } }
        end,
      },
      {
        {
          key = "t",
          desc = "Dark mode",
          flag = function()
            return vim.g.dark
          end,
        },
        function()
          vim.g.dark = not vim.g.dark
          Utils.set_colorscheme()
          Cache.update { g = { dark = vim.g.dark } }
        end,
      },
      {
        {
          key = "c",
          desc = "Auto Completion",
          flag = function()
            return not vim.g.cmp_disable
          end,
        },
        function()
          vim.g.cmp_disable = not vim.g.cmp_disable
          Cache.update { g = { cmp_disable = vim.g.cmp_disable } }
        end,
      },
      {
        {
          key = "d",
          desc = "Dim",
          flag = function()
            return vim.g.dim == true
          end,
        },
        function()
          vim.g.dim = not vim.g.dim
          vim.cmd "DimToggle"
          Cache.update { g = { dim = vim.g.dim } }
        end,
      },
      {
        {
          key = "w",
          desc = "Wrap",
          flag = function()
            return vim.opt.wrap:get()
          end,
        },
        function()
          local s = not vim.opt.wrap:get()
          vim.opt.wrap = s
          local i = s == true and "true" or "false"
          vim.cmd("tabdo windo lua vim.opt.wrap = " .. i)
          Cache.update { opt = { wrap = s } }
        end,
      },
      {
        {
          key = "v",
          desc = "Virtual Text",
          flag = function()
            return vim.g.dianostic_virtualtext
          end,
        },
        function()
          vim.g.dianostic_virtualtext = not vim.g.dianostic_virtualtext
          if vim.g.dianostic_virtualtext == true then
            vim.diagnostic.config { virtual_lines = { current_line = true } }
          else
            vim.diagnostic.config { virtual_lines = false }
          end
          Cache.update { g = { dianostic_virtualtext = vim.g.dianostic_virtualtext } }
        end,
      },
      {
        {
          key = "i",
          desc = "Inlay hints",
          flag = function()
            return vim.g.inlay_hints
          end,
        },
        function()
          local s = not vim.g.inlay_hints
          vim.g.inlay_hints = s
          local enable = s and "true" or "false"
          vim.cmd("tabdo windo lua vim.lsp.inlay_hint.enable(" .. enable .. ", { bufnr = 0 })")
          Cache.update { g = { inlay_hints = s } }
        end,
      },
      {
        {
          key = "f",
          desc = "Auto format",
          flag = function()
            return not vim.g.disable_autoformat
          end,
        },
        function()
          vim.g.disable_autoformat = not vim.g.disable_autoformat
          Cache.update { g = { disable_autoformat = vim.g.disable_autoformat } }
        end,
      },
      {
        {
          key = "q",
          desc = "Quit",
          quit = true,
          hidden = true,
        },
      },
    },
  })
end

return M
