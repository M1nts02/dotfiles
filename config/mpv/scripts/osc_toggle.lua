local visibility = "never"
mp.commandv("script-message", "osc-visibility", visibility)

mp.register_script_message("cycle-visibility", function()
  if visibility == "never" then
    visibility = "always"
  elseif visibility == "always" then
    visibility = "auto"
  else
    visibility = "never"
  end
  mp.commandv("script-message", "osc-visibility", visibility)
end)
