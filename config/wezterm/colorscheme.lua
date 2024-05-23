local wezterm = require "wezterm"

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
