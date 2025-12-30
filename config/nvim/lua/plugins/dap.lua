local M = {
  "mfussenegger/nvim-dap",
  event = { "VeryLazy" },
  dependencies = { "miroshQa/debugmaster.nvim" },
}

M.keys = {
  {
    "<Space>d",
    function()
      local dm = require "debugmaster"

      dm.mode.toggle()
    end,
    mode = { "n", "v" },
    desc = "Debug Mode",
  },
}

function M.config()
  local dap = require "dap"

  local adapters = Utils.load_json_file(ConfPath .. "/adapters.json") or {}
  for k, v in pairs(adapters) do
    dap.adapters[k] = v
  end

  local configurations = Utils.load_json_file(ConfPath .. "/dapConf.json") or {}
  for k, v in pairs(configurations) do
    v[1]["program"] = v[1]["program"] == "${input}"
        and function()
          return vim.fn.input "Path to executable: "
        end
      or v[1]["program"]
    dap.configurations[k] = v
  end
end

return M
