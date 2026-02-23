local M = {}

M["Reload"] = function()
  hs.reload()
  hs.notify.new():title("Reload"):subTitle("Hammerspoon reloading..."):send()
end

M["Dark Mode"] = function()
  hs.osascript.applescript [[
tell application "System Events"
    tell appearance preferences
        set dark mode to not dark mode
    end tell
end tell
    ]]
end

M["Finder"] = function()
  hs.application.launchOrFocus "/System/Library/CoreServices/Finder.app"
end

M["Trash"] = function()
  hs.osascript.applescript [[
tell application "Finder"
  open trash
  set the current view of the front Finder window to list view
  activate
end tell
]]
end

M["ScreenSaver"] = function()
  hs.osascript.applescript 'tell application "ScreenSaverEngine" to run'
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

M["Window Default"] = function()
  hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.65, 0.7 }
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

M["Network"] = function()
  hs.execute "open 'x-apple.systempreferences:com.apple.Network-Settings.extension'"
end

M["Dock"] = function()
  hs.eventtap.keyStroke({ "fn" }, "a")
end

M["Character Viewer "] = function()
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

M["FinderZi"] = function()
  hs.osascript.applescript [[
set shell_command to "source ~/.zshrc; zoxide query -l | choose | xargs -I {} echo {}"
set my_posix_path to do shell script shell_command

if my_posix_path is "" then
    return
end if

tell application "Finder"
  activate
  if (count of Finder windows) > 0 then
    set target of front Finder window to (POSIX file my_posix_path as alias)
  else
    make new Finder window to (POSIX file my_posix_path as alias)
  end if
end tell
]]
end

M["GhosttyZi"] = function()
  hs.osascript.applescript [[
set shell_command to "source ~/.zshrc; zoxide query -l | choose | xargs -I {} echo {}"
set my_posix_path to do shell script shell_command

if my_posix_path is "" then
    return
end if

do shell script "/Applications/Ghostty.app/Contents/MacOS/ghostty  --window-save-state=never --working-directory=\"" & my_posix_path & "\""
]]
end

M["ChooseOpener"] = function()
  hs.osascript.applescript [[
-- get choosed file with Finder
tell application "Finder"
  if (count of Finder windows) is 0 then
    display notification "没有打开的 Finder 窗口" with title "提示"
    return
  end if

  set selectedFiles to selection as alias list
  if selectedFiles is {} then
    display notification "请先选择文件" with title "提示"
    return
  end if
end tell

-- get file path
set fileArgs to ""
repeat with f in selectedFiles
  set fileArgs to fileArgs & quoted form of POSIX path of f & " "
end repeat

-- set choose path
set choosePath to "/opt/homebrew/bin/choose"

-- get Apps
set listCmd to "/bin/ls /Applications/ /Applications/Utilities/ /System/Applications/ /System/Applications/Utilities/ 2>/dev/null | grep '\\.app$' | sed 's/\\.app$//g'"

try
  set chosenApp to do shell script listCmd & " | " & choosePath
  if chosenApp is "" then return -- cancel

  -- open file
  do shell script "open -a " & quoted form of (chosenApp & ".app") & " " & fileArgs

on error
  return
end try
]]
end

return M
