local add = Menu.add
local singleKey = Menu.singleKey
local ss = require "actions.screenshot"

add("Screenshot", {
  { singleKey("2", "Clipboard"), function() ss.ScreenShot "Clipboard" end },
  { singleKey("3", "Screen"), function() ss.ScreenShot "Screen" end },
  { singleKey("4", "Area"), function() ss.ScreenShot "Area" end },
  { singleKey("5", "App"), function() ss.ScreenShot "App" end },
})
