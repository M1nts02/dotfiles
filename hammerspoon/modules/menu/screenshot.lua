local add = Menu.add
local singleKey = Menu.singleKey

add("Screenshot", {
  { singleKey("2", "Clipboard"), actions["Screenshot Clipboard"].run },
  --{ singleKey("3", "Screen"), actions["Screenshot Screen"].run },
  { singleKey("4", "Area"), actions["Screenshot Area"].run },
  { singleKey("5", "App"), actions["Screenshot App"].run },
  { singleKey("q", "Quit"), function() end },
})
