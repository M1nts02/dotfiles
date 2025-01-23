local M = {}

-- default cache file path
local cache_path = vim.fn.stdpath "config" .. "/.cache.json"

-- default cache
local cache = {
  g = {
    autopairs = false,
    cmp_disable = false,
    dianostic_virtualtext = false,
    inlay_hints = true,
    disable_autoformat = false,
    fittencode = false,
    dark = true,
  },
  opt = {
    wrap = true,
    number = true,
    relativenumber = true,
  },
}

local function update_cache_file()
  local cache_file = io.open(cache_path, "w")
  local context = vim.json.encode(cache)
  cache_file:write(context)
  cache_file:close()
end

local function load_cache()
  local file = io.open(cache_path, "r")
  if file then
    cache = vim.json.decode(file:read "*a")
  else
    update_cache_file()
  end
end

function M.load()
  load_cache()

  for i, t in pairs(cache) do
    if type(t) == "table" then
      for o, v in pairs(t) do
        vim[i][o] = v
      end
    end
  end
end

function M.update(opts)
  for i, t in pairs(opts) do
    if type(t) == "table" then
      for o, v in pairs(t) do
        vim[i][o] = v
        cache[i][o] = v
      end
    end
  end

  update_cache_file()
end

function M.get_status()
  return cache
end

return M
