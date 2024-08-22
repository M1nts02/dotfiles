local visibility = "never"
mp.commandv("script-message", "osc-visibility", visibility)

mp.register_script_message("cycle-visibility", function()
  visibility = visibility == "never" and "always" or "never"
  mp.commandv("script-message", "osc-visibility", visibility)
end)
