local M = {}

_G.build_info = {}
local plugins = {}
local configs = {}

--- A function to complete plugin name
function M.plugins_complete(arglead, cmdline, cursorpos)
  local plist = vim.pack.get() or {}
  local names = {}
  for _, plugin in ipairs(plist) do
    local name = plugin.spec and plugin.spec.name
    table.insert(names, name)
  end
  return Utils.cmdline_complete(arglead, cmdline, cursorpos, names)
end

-- Add plugin
function M.add(plugin)
  local opt = type(plugin) == "string" and { plugin } or plugin
  if (type(opt[1]) ~= "string" and type(opt.src) ~= "string") or opt.enabled == false then
    return
  end

  -- build info
  local name = opt.name or string.gsub(opt.src or opt[1], ".*/", "")
  if type(opt.build) == "function" or type(opt.build) == "string" then
    build_info[name] = { build = opt.build }
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

-- Load directory
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

-- Build Plugins
---@param p table
local function plugins_build(p)
  if type(p) ~= "table" then
    return
  end

  if #p == 0 then
    for i, _ in pairs(build_info) do
      table.insert(p, i)
    end
  end

  for _, name in pairs(p) do
    if name and build_info[name] then
      local info = build_info[name]
      local pack_info = vim.pack.get({ name }, { info = false })[1]
      if not pack_info then
        return
      end
      local path = pack_info.path
      local build = info.build
      if type(build) == "function" then
        build { name = name, path = path }
      elseif type(build) == "string" then
        if string.sub(build, 1, 1) == ":" then
          vim.cmd(string.sub(build, 2))
        else
          vim.cmd("!(cd  " .. path .. " && " .. info.build .. ")")
        end
      end
    end
  end
end

vim.api.nvim_create_user_command("PackBuild", function(opts)
  plugins_build(opts.fargs)
end, {
  desc = "Build plugins",
  nargs = "*",
  complete = function(arglead, cmdline, cursorpos)
    local plist = {}
    for i, _ in pairs(build_info) do
      table.insert(plist, i)
    end
    return Utils.cmdline_complete(arglead, cmdline, cursorpos, plist)
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(args)
    local data = args.data or {}
    local kind = data.kind
    if kind ~= "install" and kind ~= "update" then
      return
    end
    local name = data.spec and data.spec.name
    plugins_build { name }
  end,
})

-- Clean Plugins
vim.api.nvim_create_user_command("PackClean", function()
  local all_packs = vim.pack.get(nil, { info = false })
  local inactive = {}
  for _, pack in ipairs(all_packs) do
    if pack.active == false then
      table.insert(inactive, pack.spec.name)
    end
  end
  if #inactive == 0 then
    vim.notify("No inactive plugins to uninstall", vim.log.levels.INFO)
    return
  end
  vim.pack.del(inactive)
end, { desc = "Uninstall all inactive plugins" })

-- Update Plugins
vim.api.nvim_create_user_command("PackUpdate", function(opts)
  local fargs = opts.fargs
  if #fargs == 0 then
    vim.pack.update()
  else
    vim.pack.update(fargs)
  end
end, { desc = "Update plugins", nargs = "*", complete = M.plugins_complete })

-- Show Plugins Status
vim.api.nvim_create_user_command("PackStatus", function(opts)
  local fargs = opts.fargs
  if #fargs == 0 then
    vim.pack.update(nil, { offline = true })
  else
    vim.pack.update(fargs, { offline = true })
  end
end, { desc = "Show plugins Status", nargs = "*", complete = M.plugins_complete })

return M
