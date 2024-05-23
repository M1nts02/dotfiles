local wezterm = require "wezterm"
local mux = wezterm.mux

local cache_dir = os.getenv "HOME" .. "/.cache/wezterm/"
local window_size_cache_path = cache_dir .. "window_size_cache.txt"

wezterm.on("gui-startup", function()
  os.execute("mkdir " .. cache_dir)
  local width = 140
  local height = 45

  local window_size_cache_file = io.open(window_size_cache_path, "r")
  if window_size_cache_file ~= nil then
    _, _, width, height = string.find(window_size_cache_file:read(), "(%d+),(%d+)")
    window_size_cache_file:close()
  end

  mux.spawn_window { width = tonumber(width), height = tonumber(height) }
end)

wezterm.on("window-resized", function(window, pane)
  local window_size_cache_file = io.open(window_size_cache_path, "w")

  local tab_size = pane:tab():get_size()
  local cols = tab_size["cols"]
  local rows = tab_size["rows"]

  local contents = string.format("%d,%d", cols, rows)
  window_size_cache_file:write(contents)
  window_size_cache_file:close()
end)
