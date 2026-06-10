local M = {}

local ZOXIDE_PATH = "/opt/homebrew/bin/zoxide"
local CHOOSE_PATH = "/opt/homebrew/bin/choose"

function M.has_file_dialog()
  local ok, result = hs.osascript.applescript([[
tell application "System Events"
    set frontProcess to first process whose frontmost is true
    tell frontProcess
        try
            return (count of sheets of front window) > 0
        on error
            return false
        end try
    end tell
end tell
]])
  return ok and result == true
end

function M.choose_path()
  if not M.has_file_dialog() then
    hs.notify.show("Zoxide", "Please open a file dialog first", "No open file dialog detected in the current focused window")
    return
  end

  local script = [[
set shell_command to "ZOXIDE_PATH query -l | CHOOSE_PATH | xargs -I {} echo {}"
set my_posix_path to do shell script shell_command

if my_posix_path is "" then
    return
end if

-- Navigate to the selected path in the file dialog
tell application "System Events"
    keystroke "g" using {command down, shift down}
    delay 0.3
    keystroke my_posix_path
    delay 0.2
    keystroke return
end tell
]]
  local ok, result = hs.osascript.applescript(script:gsub("ZOXIDE_PATH", ZOXIDE_PATH):gsub("CHOOSE_PATH", CHOOSE_PATH))

  if not ok then
    hs.notify.show("Zoxide", "AppleScript execution failed", "")
  end
end

function M.zfinder()
  local script = [[
set shell_command to "ZOXIDE_PATH query -l | CHOOSE_PATH | xargs -I {} echo {}"
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
  hs.osascript.applescript(script:gsub("ZOXIDE_PATH", ZOXIDE_PATH):gsub("CHOOSE_PATH", CHOOSE_PATH))
end

function M.zoxide()
  if M.has_file_dialog() then
    M.choose_path()
  else
    M.zfinder()
  end
end

return M
