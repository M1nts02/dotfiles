local wezterm = require "wezterm"
local options = wezterm.config_builder()

local is_windows = string.find(wezterm.target_triple, "windows") ~= nil
local is_linux = string.find(wezterm.target_triple, "linux") ~= nil
local is_mac = string.find(wezterm.target_triple, "apple") ~= nil

-- Shell
if is_windows then
  options.default_prog = { "powershell" }
end

-- Init options
options.term = "xterm-256color"
options.animation_fps = 60
options.max_fps = 60
options.front_end = "WebGpu"
options.webgpu_power_preference = "HighPerformance"
options.win32_system_backdrop = "Acrylic"
options.window_background_opacity = 1.0
options.text_background_opacity = 1.0
options.macos_window_background_blur = 40
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

-- Tab bar
options.enable_tab_bar = true
options.hide_tab_bar_if_only_one_tab = false
options.tab_bar_at_bottom = true
options.tab_and_split_indices_are_zero_based = false
options.use_fancy_tab_bar = false
options.tab_max_width = 100
options.show_tabs_in_tab_bar = true
options.show_new_tab_button_in_tab_bar = false

local function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local tab_index = tab.tab_index + 1

  local title = " " .. tab_index .. " " .. basename(pane.foreground_process_name)

  if tab.is_active then
    return {
      { Text = title .. ":* " },
    }
  end
  return {
    { Text = title .. " " },
  }
end)

-- Mapping
local act = wezterm.action
options.leader = is_windows and { key = "b", mods = "ALT", timeout_milliseconds = 3000 }
  or { key = "b", mods = "SUPER", timeout_milliseconds = 3000 }

options.keys = {
  { key = "v", mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
  { key = "s", mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },

  { key = "LeftArrow", mods = "LEADER", action = act.ActivatePaneDirection "Left" },
  { key = "RightArrow", mods = "LEADER", action = act.ActivatePaneDirection "Right" },
  { key = "UpArrow", mods = "LEADER", action = act.ActivatePaneDirection "Up" },
  { key = "DownArrow", mods = "LEADER", action = act.ActivatePaneDirection "Down" },
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection "Left" },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection "Right" },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection "Up" },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection "Down" },
  { key = "LeftArrow", mods = "SUPER", action = act.ActivatePaneDirection "Left" },
  { key = "RightArrow", mods = "SUPER", action = act.ActivatePaneDirection "Right" },
  { key = "UpArrow", mods = "SUPER", action = act.ActivatePaneDirection "Up" },
  { key = "DownArrow", mods = "SUPER", action = act.ActivatePaneDirection "Down" },

  -- Create tab
  { key = "t", mods = "LEADER", action = act.SpawnTab "CurrentPaneDomain" },

  { key = "1", mods = "LEADER", action = act.ActivateTab(0) },
  { key = "2", mods = "LEADER", action = act.ActivateTab(1) },
  { key = "3", mods = "LEADER", action = act.ActivateTab(2) },
  { key = "4", mods = "LEADER", action = act.ActivateTab(3) },
  { key = "5", mods = "LEADER", action = act.ActivateTab(4) },
  { key = "6", mods = "LEADER", action = act.ActivateTab(5) },
  { key = "7", mods = "LEADER", action = act.ActivateTab(6) },
  { key = "8", mods = "LEADER", action = act.ActivateTab(7) },

  { key = "Escape", mods = "SUPER", action = act.ActivateCopyMode },

  { key = "P", mods = "SUPER", action = wezterm.action.ActivateCommandPalette },
}
options.key_tables = {
  search_mode = {
    { key = "Enter", mods = "NONE", action = act.CopyMode "PriorMatch" },
    { key = "Escape", mods = "NONE", action = act.CopyMode "Close" },
    { key = "r", mods = "SUPER", action = act.CopyMode "CycleMatchType" },
    { key = "u", mods = "SUPER", action = act.CopyMode "ClearPattern" },
    { key = "PageDown", mods = "NONE", action = act.CopyMode "NextMatchPage" },
    { key = "PageUp", mods = "NONE", action = act.CopyMode "PriorMatchPage" },
    { key = "DownArrow", mods = "NONE", action = act.CopyMode "NextMatch" },
    { key = "n", mods = "SUPER", action = act.CopyMode "NextMatch" },
    { key = "p", mods = "SUPER", action = act.CopyMode "PriorMatch" },
    { key = "UpArrow", mods = "NONE", action = act.CopyMode "PriorMatch" },
  },
}

if is_windows then
  table.insert(options.keys, {
    key = "Escape",
    mods = "ALT",
    action = act.ActivateCopyMode,
  })
end

-- Auto switch theme
local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return "Dark"
end

local appearance = get_appearance()

if appearance:find "Dark" then
  options.color_scheme = "Catppuccin Mocha (Gogh)"
  options.command_palette_bg_color = "#333648"
  options.command_palette_fg_color = "#9c9c9c"
  options.colors = {
    tab_bar = {
      background = "rgba(0,0,0,0)",
      active_tab = {
        bg_color = "rgba(0,0,0,0)",
        fg_color = "#F000F0",
        intensity = "Bold",
        underline = "None",
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = "rgba(0,0,0,0)",
        fg_color = "#1e90ff",
      },
      inactive_tab_hover = {
        bg_color = "rgba(0,0,0,0)",
        fg_color = "#1e90ff",
      },
      new_tab = {
        bg_color = "rgba(0,0,0,0)",
        fg_color = "#1e90ff",
      },
      new_tab_hover = {
        bg_color = "rgba(0,0,0,0)",
        fg_color = "#1e90ff",
      },
    },
  }
else
  options.color_scheme = "Night Owlish Light"
  options.command_palette_bg_color = "#eff0f9"
  options.command_palette_fg_color = "#008b8b"
  options.colors = {
    tab_bar = {
      background = "rgba(0,0,0,0)",
      active_tab = {
        bg_color = "rgba(0,0,0,0)",
        fg_color = "#0610A8",
        intensity = "Bold",
        underline = "None",
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = "rgba(0,0,0,0)",
        fg_color = "#1e90ff",
      },
      inactive_tab_hover = {
        bg_color = "rgba(0,0,0,0)",
        fg_color = "#1e90ff",
      },
      new_tab = {
        bg_color = "rgba(0,0,0,0)",
        fg_color = "#1e90ff",
      },
      new_tab_hover = {
        bg_color = "rgba(0,0,0,0)",
        fg_color = "#1e90ff",
      },
    },
  }
end

return options
