local add = Menu.add
local singleKey = Menu.singleKey

add("Screenshot", {
  { singleKey("2", "Clipboard"), Actions["Screenshot Clipboard"].run },
  { singleKey("3", "Screen"), Actions["Screenshot Screen"].run },
  { singleKey("4", "Area"), Actions["Screenshot Area"].run },
  { singleKey("5", "App"), Actions["Screenshot App"].run },
  { singleKey("q", "Quit"), function() end },
})
