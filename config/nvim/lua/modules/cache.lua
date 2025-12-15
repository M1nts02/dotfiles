local M = {}

-- default cache file path
local cache_path = vim.g.confpath .. "/.cache.json"

-- Open cache file
vim.api.nvim_create_user_command("CustomOpen", function()
  vim.cmd("e " .. cache_path)
end, {
  desc = "Open cache file",
})

-- default cache
local options = {
  g = {
    cmp_disable = false,
    dianostic_virtualtext = false,
    inlay_hints = true,
    disable_autoformat = false,
    dark = true,
    minipairs_disable = true,
    transparent = false,
    dark_theme = "akane-dark",
    light_theme = "akane-light",
    python3_host_prog = "python3",
    dim = false,
  },
  opt = {
    wrap = true,
    cursorline = false,
    cursorcolumn = false,
    number = true,
    relativenumber = true,
  },
}

local function update_cache_file()
  local cache_file = io.open(cache_path, "w")
  local context = vim.json.encode(options)
  cache_file:write(context)
  cache_file:close()
end

function M.load()
  local file = io.open(cache_path, "r")
  if file then
    options = vim.json.decode(file:read "*a")
  else
    update_cache_file()
  end

  for i, t in pairs(options) do
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
        options[i][o] = v
      end
    end
  end

  update_cache_file()
end

function M.get_status()
  return options
end

return M
