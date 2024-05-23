local wezterm = require "wezterm"

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
