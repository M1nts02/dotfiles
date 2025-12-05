return {
  ---------------------------------- Dap -------------------------------
  {
    "mfussenegger/nvim-dap",
    event = { "VeryLazy" },
    dependencies = { "miroshQa/debugmaster.nvim", "M1nts02/nvim-menu" },
    config = function()
      local dap = require "dap"

      ----------- Adapters --------------
      local adapters = io.open(vim.g.confpath .. "/adapters.json", "r")
      if adapters ~= nil then
        local adt = vim.json.decode(adapters:read "*a")
        adapters:close()
        for k, v in pairs(adt) do
          dap.adapters[k] = v
        end
      end

      ------------ Configurations ---------------
      local configurations = io.open(vim.g.confpath .. "/dapConf.json", "r")
      if configurations ~= nil then
        local conf = vim.json.decode(configurations:read "*a")
        configurations:close()
        for k, v in pairs(conf) do
          v[1]["program"] = v[1]["program"] == "${input}"
              and function()
                return vim.fn.input "Path to executable: "
              end
            or v[1]["program"]
          dap.configurations[k] = v
        end
      end
    end,
  },
  ---------------------------------- Debug Master -------------------------------
  {
    "miroshQa/debugmaster.nvim",
    event = { "VeryLazy" },
    keys = {
      {
        "<Space>d",
        function()
          local dm = require "debugmaster"
          local menu = require "nvim-menu"

          dm.mode.toggle()
          if require("debugmaster.debug.mode").is_active() then
            menu.open "Debug"
          else
            menu.close "Debug"
          end
        end,
        mode = { "n", "v" },
        desc = "Debug Mode",
      },
    },
    config = function()
      local menu = require "nvim-menu"

      menu.add("Debug", {
        config = {
          format = "${KEY} ${DESC}",
          position = "BR",
          type = "helper",
          quit = false,
        },
        items = {
          { { key = "t", desc = "Breakpoint" } },
          { { key = "H", desc = "Help" } },
          { { key = "u", desc = "Side panel" } },
          { { key = "c", desc = "Start" } },
          { { key = "o", desc = "Step over" } },
          { { key = "m", desc = "Step into" } },
          { { key = "q", desc = "Step out" } },
          { { key = "r", desc = "Run to cursor" } },
        },
      })
    end,
  },
}
