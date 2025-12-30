local M = {}

local load_json_file = Utils.load_json_file
local update_json_file = Utils.update_json_file

-- default cache file path
local cache_path = ConfPath .. "/.cache.json"

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
    cursorline = true,
    cursorcolumn = true,
    number = true,
    relativenumber = true,
  },
}

function M.load()
  local opt = load_json_file(cache_path)
  if opt then
    options = opt or options
  else
    update_json_file(cache_path, options)
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

  update_json_file(cache_path, options)
end

return M
