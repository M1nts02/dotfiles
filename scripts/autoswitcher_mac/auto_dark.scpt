on run {}
  tell application "System Events"
    tell appearance preferences
      set isDarkMode to not dark mode
      set dark mode to isDarkMode
    end tell
  end tell
  do shell script "/usr/bin/python3 /Users/m1nts02/dotfiles/scripts/autoswitcher_mac/autoswitcher.py " & isDarkMode
end run
