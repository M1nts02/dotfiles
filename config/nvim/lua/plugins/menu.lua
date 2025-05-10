local utils = require "modules.utils"
local cache = require "modules.cache"

local setmap = utils.setmap
local update = cache.update
local get_status = cache.get_status

local menu = require "nvim-menu"
menu.add("Menu", {
  config = {
    -- format = "${FLAG} [${KEY}] ${DESC}",
    -- flag_len = 1,
    quit = false,
    foreign_keys = false,
    window = {
      position = "CC",
    },
  },
  items = {
    {
      "p",
      function()
        local s = not get_status().g.minipairs_disable
        update { g = { minipairs_disable = s } }
      end,
      {
        desc = "Auto pairs",
        flag = function()
          local s = not get_status().g.minipairs_disable
          return s
        end,
      },
    },
    {
      "t",
      function()
        local s = not get_status().g.dark
        update { g = { dark = s } }
        if s == true then
          vim.cmd("colorscheme " .. vim.g.dark_theme)
        else
          vim.cmd("colorscheme " .. vim.g.light_theme)
        end
      end,
      {
        desc = "Dark mode",
        flag = function()
          local s = get_status().g.dark
          if s then
            return true
          else
            return false
          end
        end,
      },
    },
    {
      "c",
      function()
        local enable = (vim.g.cmp_disable == false and vim.b.cmp_disable == false) and true or false
        if enable then
          vim.g.cmp_disable = true
          vim.b.cmp_disable = true
          update { g = { cmp_disable = true } }
        else
          vim.g.cmp_disable = false
          vim.b.cmp_disable = false
          update { g = { cmp_disable = false } }
        end
      end,
      {
        desc = "Auto Completion",
        flag = function()
          local enable = (vim.g.cmp_disable == false and vim.b.cmp_disable ~= true) and true or false
          if enable then
            return true
          else
            return false
          end
        end,
      },
    },
    {
      "w",
      function()
        local s = not get_status().opt.wrap
        local i = s == true and "true" or "false"
        vim.cmd("tabdo windo lua vim.opt.wrap = " .. i)
        update { opt = { wrap = s } }
      end,
      {
        desc = "Wrap",
        flag = function()
          local s = get_status().opt.wrap
          if s then
            return true
          else
            return false
          end
        end,
      },
    },
    {
      "v",
      function()
        local s = not get_status().g.dianostic_virtualtext
        update { g = { dianostic_virtualtext = s } }
        if vim.g.dianostic_virtualtext == true then
          vim.diagnostic.config { virtual_lines = { current_line = true } }
        else
          vim.diagnostic.config { virtual_lines = false }
        end
      end,
      {
        desc = "Virtual Text",
        flag = function()
          local s = get_status().g.dianostic_virtualtext
          if s then
            return true
          else
            return false
          end
        end,
      },
    },
    {
      "i",
      function()
        local s = not get_status().g.inlay_hints
        update { g = { inlay_hints = s } }
        local enable = vim.g.inlay_hints and "true" or "false"
        vim.cmd("tabdo windo lua vim.lsp.inlay_hint.enable(" .. enable .. ", { bufnr = 0 })")
      end,
      {
        desc = "Inlay hints",
        flag = function()
          local s = get_status().g.inlay_hints
          if s then
            return true
          else
            return false
          end
        end,
      },
    },
    {
      "f",
      function()
        local s = not get_status().g.disable_autoformat
        vim.g.zig_fmt_autosave = s == true and 0 or 1
        update { g = { disable_autoformat = s } }
      end,
      {
        desc = "Auto format",
        flag = function()
          local s = get_status().g.disable_autoformat
          if s == true then
            return false
          else
            return true
          end
        end,
      },
    },
  },
})

setmap {
  {
    { "n" },
    "\\",
    function()
      require("nvim-menu").open "Menu"
    end,
    { noremap = true, desc = "Menu" },
  },
}
