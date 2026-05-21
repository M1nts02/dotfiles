local add = Menu.add
local singleKey = Menu.singleKey

add("Screenshot", {
  { singleKey("2", "Clipboard"), function() Utils.ScreenShot { mode = "Clipboard" } end },
  { singleKey("3", "Screen"), function() Utils.ScreenShot { mode = "Screen", notify = true } end },
  { singleKey("4", "Area"), function() Utils.ScreenShot { mode = "Area" } end },
  { singleKey("5", "App"), function() Utils.ScreenShot { mode = "App", notify = true } end },
  { singleKey("q", "Quit"), function() end },
})
