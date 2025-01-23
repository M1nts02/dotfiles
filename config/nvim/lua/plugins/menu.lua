local cache = require "modules.cache"
local update = cache.update
local get_status = cache.get_status

local keys = {
  {
    "\\",
    function()
      require("nvim-menu").open "Menu"
    end,
    desc = "Menu",
  },
}

local config = function()
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
          local s = not get_status().g.autopairs
          update { g = { autopairs = s } }
          if s == true then
            require("nvim-autopairs").enable()
          else
            require("nvim-autopairs").disable()
          end
        end,
        {
          desc = "Auto pairs",
          flag = function()
            local s = get_status().g.autopairs
            if s then
              return true
            else
              return false
            end
          end,
        },
      },
      {
        "t",
        function()
          local s = not get_status().g.dark
          update { g = { dark = s } }
          if s == true then
            vim.cmd "colorscheme akane-dark"
          else
            vim.cmd "colorscheme akane-light"
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
            local enable = (vim.g.cmp_disable == false and vim.b.cmp_disable == false) and true or false
            if enable then
              return true
            else
              return false
            end
          end,
        },
      },
      {
        "C",
        function()
          local s = not get_status().g.fittencode
          update { g = { fittencode = s } }
          if s == true then
            vim.cmd "Fitten enable_completions"
          else
            vim.cmd "Fitten disable_completions"
          end
        end,
        {
          desc = "Fitten Code AI",
          flag = function()
            return get_status().g.fittencode
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
          vim.diagnostic.config { virtual_text = vim.g.dianostic_virtualtext }
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
          vim.g.zig_fmt_autosave = vim.g.zig_fmt_autosave == 1 and 0 or 1
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
      {
        "n",
        function()
          local s = not get_status().opt.number
          local i = s == true and "true" or "false"
          vim.cmd("tabdo windo lua vim.opt.number = " .. i)
          update { opt = { number = s } }
        end,
        {
          desc = "Number",
          flag = function()
            local s = get_status().opt.number
            if s then
              return true
            else
              return false
            end
          end,
        },
      },
      {
        "N",
        function()
          local s = not get_status().opt.relativenumber
          local i = s == true and "true" or "false"
          vim.cmd("tabdo windo lua vim.opt.relativenumber = " .. i)
          update { opt = { relativenumber = s } }
        end,
        {
          desc = "Relativenumber",
          flag = function()
            local s = get_status().opt.relativenumber
            if s then
              return true
            else
              return false
            end
          end,
        },
      },
    },
  })
end

return {
  "M1nts02/nvim-menu",
  keys = keys,
  config = config,
}
