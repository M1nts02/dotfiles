return {
  "mfussenegger/nvim-dap",
  dependencies = { "miroshQa/debugmaster.nvim" },
  config = function()
    local dap = require "dap"
    for k, v in pairs(require "plugins.dap.adapters") do dap.adapters[k] = v end
    for k, v in pairs(require "plugins.dap.configurations") do dap.configurations[k] = v end
    Utils.setmap { { { "n", "v" }, "<Leader>d", require("debugmaster").mode.toggle, { desc = "Debug Mode" } } }
    require("plugins.dap.statuscol")
  end,
}
