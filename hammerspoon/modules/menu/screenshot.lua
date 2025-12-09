local add = Menu.add
local singleKey = Menu.singleKey

add("Screenshot", {
  { singleKey("2", "Clipboard"), actions["Screenshot Clipboard"] },
  { singleKey("3", "Screen"), actions["Screenshot Screen"] },
  { singleKey("4", "Area"), actions["Screenshot Area"] },
  { singleKey("5", "App"), actions["Screenshot App"] },
  { singleKey("q", "Quit"), function() end },
})
