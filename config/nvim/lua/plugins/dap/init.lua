return {
  "mfussenegger/nvim-dap",
  dependencies = { "miroshQa/debugmaster.nvim" },
  config = function()
    local dap = require "dap"

    for k, v in pairs(require "plugins.dap.adapters") do
      dap.adapters[k] = v
    end

    for k, v in pairs(require "plugins.dap.configurations") do
      dap.configurations[k] = v
    end

    Utils.setmap {
      {
        { "n", "v" },
        "<Leader>d",
        function()
          local dm = require "debugmaster"
          dm.mode.toggle()
        end,
        { desc = "Debug Mode" },
      },
    }
  end,
}
