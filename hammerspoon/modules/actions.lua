local M = {}

M["Reload"] = function()
  hs.reload()
  hs.notify.new():title("Reload"):subTitle("Hammerspoon reloading..."):send()
end

M["Finder"] = function()
  hs.application.launchOrFocus "/System/Library/CoreServices/Finder.app"
end

M["Screenshot Clipboard"] = function()
  Utils.ScreenShot { mode = "Clipboard" }
end

M["Screenshot Screen"] = function()
  Utils.ScreenShot { mode = "Screen", notify = true }
end

M["Screenshot Area"] = function()
  Utils.ScreenShot { mode = "Area" }
end

M["Screenshot App"] = function()
  Utils.ScreenShot { mode = "App", notify = true }
end

M["Window Maximize"] = function()
  hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.99 }
end

M["Window Center"] = function()
  hs.window.focusedWindow():moveToUnit { 0.175, 0.125, 0.65, 0.75 }
end

M["Window Left"] = function()
  hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.4925, 0.99 }
end

M["Window Right"] = function()
  hs.window.focusedWindow():moveToUnit { 0.5025, 0.005, 0.4925, 0.99 }
end

M["Window Top"] = function()
  hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.4925 }
end

M["Window Bottom"] = function()
  hs.window.focusedWindow():moveToUnit { 0.005, 0.5025, 0.99, 0.99 }
end

M["Window Top Left"] = function()
  hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.4925, 0.4925 }
end

M["Window Top Right"] = function()
  hs.window.focusedWindow():moveToUnit { 0.5025, 0.005, 0.4925, 0.4925 }
end

M["Window Bottom Left"] = function()
  hs.window.focusedWindow():moveToUnit { 0.005, 0.5025, 0.4925, 0.4925 }
end

M["Window Bottom Right"] = function()
  hs.window.focusedWindow():moveToUnit { 0.5025, 0.5025, 0.4925, 0.4925 }
end

M["Window Default"] = function()
  hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.65, 0.99 }
end

M["Play"] = function()
  hs.eventtap.event.newSystemKeyEvent("PLAY", true):post()
  hs.eventtap.event.newSystemKeyEvent("PLAY", false):post()
end

M["Prev"] = function()
  hs.eventtap.event.newSystemKeyEvent("PREVIOUS", true):post()
  hs.eventtap.event.newSystemKeyEvent("PREVIOUS", false):post()
end

M["Next"] = function()
  hs.eventtap.event.newSystemKeyEvent("NEXT", true):post()
  hs.eventtap.event.newSystemKeyEvent("NEXT", false):post()
end

M["Mute Toggle"] = function()
  hs.eventtap.event.newSystemKeyEvent("MUTE", true):post()
  hs.eventtap.event.newSystemKeyEvent("MUTE", false):post()
end

M["Volume Up"] = function()
  hs.eventtap.event.newSystemKeyEvent("SOUND_UP", true):post()
  hs.eventtap.event.newSystemKeyEvent("SOUND_UP", false):post()
end

M["Volume Down"] = function()
  hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", true):post()
  hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", false):post()
end

M["Brightness Up"] = function()
  hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_UP", true):post()
  hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_UP", false):post()
end

M["Brightness Down"] = function()
  hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_DOWN", true):post()
  hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_DOWN", false):post()
end

M["Illumination Up"] = function()
  hs.eventtap.event.newSystemKeyEvent("ILLUMINATION_UP", true):post()
  hs.eventtap.event.newSystemKeyEvent("ILLUMINATION_UP", false):post()
end

M["Illumination Down"] = function()
  hs.eventtap.event.newSystemKeyEvent("ILLUMINATION_DOWN", true):post()
  hs.eventtap.event.newSystemKeyEvent("ILLUMINATION_DOWN", false):post()
end

M["Caps Lock"] = function()
  hs.eventtap.event.newSystemKeyEvent("CAPS_LOCK", true):post()
  hs.eventtap.event.newSystemKeyEvent("CAPS_LOCK", false):post()
end

--M["Rime"] = function()
--  hs.keycodes.currentSourceID "im.rime.inputmethod.Squirrel.Hans"
--  hs.eventtap.keyStroke({ "control", "shift" }, "f4")
--end

M["Dock"] = function()
  hs.eventtap.keyStroke({ "fn" }, "a")
end

M["Character Viewer"] = function()
  hs.eventtap.keyStroke({ "fn" }, "e")
end

M["Control Center"] = function()
  hs.eventtap.keyStroke({ "fn" }, "c")
end

M["Notification Center"] = function()
  hs.eventtap.keyStroke({ "fn" }, "n")
end

M["Desktop"] = function()
  hs.eventtap.keyStroke({ "fn" }, "h")
end

M["Fullscreen"] = function()
  hs.eventtap.keyStroke({ "fn" }, "f")
end

return M
