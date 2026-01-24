local terminal =
  "/Applications/Ghostty.app/Contents/MacOS/ghostty --window-decoration=none --window-position-x=30 --window-position-y=30"

return {
  ["Reload"] = {
    run = function()
      hs.reload()
      hs.notify.new():title("Reload"):subTitle("Hammerspoon reloading..."):send()
    end,
  },
  ["Dark Mode"] = {
    run = function()
      hs.osascript.applescript [[
tell application "System Events"
    tell appearance preferences
        set dark mode to not dark mode
    end tell
end tell
    ]]
    end,
  },
  ["Finder"] = {
    run = function()
      hs.application.launchOrFocus "/System/Library/CoreServices/Finder.app"
    end,
  },
  ["Trash"] = {
    run = function()
      hs.osascript.applescript [[
tell application "Finder"
  open trash
  set the current view of the front Finder window to list view
  activate
end tell
]]
    end,
  },
  ["ScreenSaver"] = {
    run = function()
      hs.osascript.applescript 'tell application "ScreenSaverEngine" to run'
    end,
  },
  ["Screenshot Clipboard"] = {
    run = function()
      utils.ScreenShot { mode = "Clipboard" }
    end,
  },
  ["Screenshot Screen"] = {
    run = function()
      utils.ScreenShot { mode = "Screen", notify = true }
    end,
  },
  ["Screenshot Area"] = {
    run = function()
      utils.ScreenShot { mode = "Area" }
    end,
  },
  ["Screenshot App"] = {
    run = function()
      utils.ScreenShot { mode = "App", notify = true }
    end,
  },
  ["Window Maximize"] = {
    run = function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.99 }
    end,
  },
  ["Window Center"] = {
    run = function()
      hs.window.focusedWindow():moveToUnit { 0.175, 0.125, 0.65, 0.75 }
    end,
  },
  ["Window Left"] = {
    run = function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.4925, 0.99 }
    end,
  },
  ["Window Right"] = {
    run = function()
      hs.window.focusedWindow():moveToUnit { 0.5025, 0.005, 0.4925, 0.99 }
    end,
  },
  ["Window Default"] = {
    run = function()
      hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.65, 0.7 }
    end,
  },
  ["Play"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("PLAY", true):post()
      hs.eventtap.event.newSystemKeyEvent("PLAY", false):post()
    end,
  },
  ["Prev"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", true):post()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", false):post()
    end,
  },
  ["Next"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("NEXT", true):post()
      hs.eventtap.event.newSystemKeyEvent("NEXT", false):post()
    end,
  },
  ["Mute Toggle"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("MUTE", true):post()
      hs.eventtap.event.newSystemKeyEvent("MUTE", false):post()
    end,
  },
  ["Volume Up"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("SOUND_UP", true):post()
      hs.eventtap.event.newSystemKeyEvent("SOUND_UP", false):post()
    end,
  },
  ["Volume Down"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", true):post()
      hs.eventtap.event.newSystemKeyEvent("SOUND_DOWN", false):post()
    end,
  },
  ["Brightness Up"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_UP", true):post()
      hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_UP", false):post()
    end,
  },
  ["Brightness Down"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_DOWN", true):post()
      hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_DOWN", false):post()
    end,
  },
  ["Illumination Up"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("ILLUMINATION_UP", true):post()
      hs.eventtap.event.newSystemKeyEvent("ILLUMINATION_UP", false):post()
    end,
  },
  ["Illumination Down"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("ILLUMINATION_DOWN", true):post()
      hs.eventtap.event.newSystemKeyEvent("ILLUMINATION_DOWN", false):post()
    end,
  },
  ["Caps Lock"] = {
    run = function()
      hs.eventtap.event.newSystemKeyEvent("CAPS_LOCK", true):post()
      hs.eventtap.event.newSystemKeyEvent("CAPS_LOCK", false):post()
    end,
  },
  ["Rime"] = {
    run = function()
      hs.keycodes.currentSourceID "im.rime.inputmethod.Squirrel.Hans"
      hs.eventtap.keyStroke({ "control", "shift" }, "f4")
    end,
    pass = true,
  },
  ["Network"] = {
    run = function()
      hs.execute "open 'x-apple.systempreferences:com.apple.Network-Settings.extension'"
    end,
  },
  ["Dock"] = {
    run = function()
      hs.eventtap.keyStroke({ "fn" }, "a")
    end,
  },
  ["Character Viewer "] = {
    run = function()
      hs.eventtap.keyStroke({ "fn" }, "e")
    end,
  },
  ["Control Center"] = {
    run = function()
      hs.eventtap.keyStroke({ "fn" }, "c")
    end,
  },
  ["Notification Center"] = {
    run = function()
      hs.eventtap.keyStroke({ "fn" }, "n")
    end,
  },
  ["Desktop"] = {
    run = function()
      hs.eventtap.keyStroke({ "fn" }, "h")
    end,
  },
  ["Fullscreen"] = {
    run = function()
      hs.eventtap.keyStroke({ "fn" }, "f")
    end,
  },
  ["FinderZi"] = {
    run = function()
      hs.osascript.applescript [[
set shell_command to "source ~/.zshrc; zoxide query -l | choose | xargs -I {} echo {}"
set my_posix_path to do shell script shell_command
tell application "Finder"
  activate
  if (count of Finder windows) > 0 then
    set target of front Finder window to (POSIX file my_posix_path as alias)
  else
    make new Finder window to (POSIX file my_posix_path as alias)
  end if
end tell
      ]]
    end,
  },
}
