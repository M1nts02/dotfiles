local wezterm = require "wezterm"
local act = wezterm.action

local is_windows = string.find(wezterm.target_triple, "windows") ~= nil

-- Mapping
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
