_G.options = {}

local wezterm = require "wezterm"

local is_windows = string.find(wezterm.target_triple, "windows") ~= nil
local is_linux = string.find(wezterm.target_triple, "linux") ~= nil
local is_mac = string.find(wezterm.target_triple, "apple") ~= nil

-- Shell
-- options.default_prog = { "/usr/bin/zsh", "-l" }

-- Init options
options.term = "xterm-256color"
options.animation_fps = 60
options.max_fps = 60
options.front_end = "WebGpu"
options.webgpu_power_preference = "HighPerformance"
options.win32_system_backdrop = "Acrylic"
options.window_background_opacity = 1.0
options.text_background_opacity = 1.0
options.macos_window_background_blur = 30
options.adjust_window_size_when_changing_font_size = true
options.window_frame = {}
options.window_decorations = is_windows and "TITLE" or "RESIZE"
options.window_close_confirmation = "AlwaysPrompt"

-- Font
options.font_size = 13
options.command_palette_font_size = 15.0
options.font = wezterm.font_with_fallback {
  { family = "RecMonoSmCasual Nerd Font Mono" },
}

require "tab_bar"
require "mapping"
require "colorscheme"

if not is_windows then
  require "startup"
end

return options
