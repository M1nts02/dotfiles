local add = Menu.add
local singleKey = Menu.singleKey

add("Screenshot", {
  { singleKey("2", "Clipboard"), Actions["Screenshot Clipboard"] },
  { singleKey("3", "Screen"), Actions["Screenshot Screen"] },
  { singleKey("4", "Area"), Actions["Screenshot Area"] },
  { singleKey("5", "App"), Actions["Screenshot App"] },
  { singleKey("q", "Quit"), function() end },
})
