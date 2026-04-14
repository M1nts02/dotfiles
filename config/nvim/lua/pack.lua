local M = {}

M.build_info = {}
local plugins = {}
local configs = {}

function M.add(plugin)
  local opt = type(plugin) == "string" and { plugin } or plugin
  if (type(opt[1]) ~= "string" and type(opt.src) ~= "string") or opt.enabled == false then
    return
  end

  -- build info
  local name = opt.name or string.gsub(opt.src or opt[1], ".*/", "")
  if type(opt.build) == "function" or type(opt.build) == "string" then
    M.build_info[name] = { build = opt.build }
  end
  -- add
  opt.src = opt.src or ("https://github.com/" .. opt[1])
  table.insert(plugins, { src = opt.src, name = opt.name, version = opt.version, data = opt.data })

  -- init
  if type(opt.init) == "function" then
    opt.init()
  end

  -- add config
  if type(opt.config) == "function" then
    if type(opt.priority) == "number" then
      table.insert(configs, opt.priority, opt.config)
    else
      table.insert(configs, opt.config)
    end
  end

  -- dependencies
  if type(opt.dependencies) == "table" then
    for _, v in ipairs(opt.dependencies) do
      M.add(v)
    end
  end
end

function M.load()
  local plugins_path = ConfPath .. "/lua/plugins"
  local entries = vim.fn.glob(plugins_path .. "/*", false, true)
  for _, entry in ipairs(entries) do
    if vim.fn.isdirectory(entry) == 1 then
      local name = vim.fn.fnamemodify(entry, ":t")
      M.add(require("plugins." .. name))
    elseif entry:match "%.lua$" then
      local name = vim.fn.fnamemodify(entry, ":t:r")
      M.add(require("plugins." .. name))
    end
  end

  -- add plugins
  vim.pack.add(plugins, { confirm = false })

  -- local configs
  vim.api.nvim_create_autocmd("VimEnter", {
    desc = "Load config",
    callback = function()
      for _, v in pairs(configs) do
        v()
      end
    end,
    once = true,
  })
end

return M
