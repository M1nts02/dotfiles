local utils = require "utils"
local terminal = "/Applications/Ghostty.app/Contents/MacOS/ghostty --window-decoration=none --background-opacity=0.85"

return {
  ["Nvim"] = function()
    hs.execute(
      "nohup "
        .. terminal
        .. " --title=Neovim"
        .. " --keybind=cmd+n=unbind"
        .. " --keybind=cmd+d=text:\x1b\x17v"
        .. " --keybind=cmd+shift+d=text:\x1b\x17s"
        .. " --keybind=cmd+w=text:\x1b\x17q"
        .. " --keybind=cmd+j=text:\x1c"
        .. " --keybind=cmd+left=text:\x1b\x17h"
        .. " --keybind=cmd+right=text:\x1b\x17l"
        .. " --keybind=cmd+up=text:\x1b\x17k"
        .. " --keybind=cmd+down=text:\x1b\x17j"
        .. " --keybind=cmd+t=text:\x1b\x17e"
        .. " --keybind=cmd+digit_1=text:\x1b\x171"
        .. " --keybind=cmd+digit_2=text:\x1b\x172"
        .. " --keybind=cmd+digit_3=text:\x1b\x173"
        .. " --keybind=cmd+digit_4=text:\x1b\x174"
        .. " --keybind=cmd+digit_5=text:\x1b\x175"
        .. " --keybind=cmd+digit_6=text:\x1b\x176"
        .. " --keybind=cmd+digit_7=text:\x1b\x177"
        .. " --keybind=cmd+digit_8=text:\x1b\x178"
        .. " --keybind=cmd+digit_9=text:\x1b\x179"
        .. " --keybind=cmd+digit_0=text:\x1b\x170"
        .. " --keybind=cmd+f=text:\x1b:"
        .. " -e nvim > /tmp/nvim.log &",
      true
    )
  end,
  ["Yazi"] = function()
    hs.execute("nohup " .. terminal .. " -e yazi > /tmp/yazi.log &", true)
  end,
  ["Reload"] = function()
    hs.reload()
    hs.notify.new():title("Reload"):subTitle("Hammerspoon reload done!"):send()
  end,
  ["Dark Mode"] = function()
    hs.shortcuts.run "暗色模式"
  end,
  ["Finder"] = function()
    hs.application.launchOrFocus "Finder"
  end,
  ["Trash"] = function()
    hs.osascript.applescript [[
tell application "Finder"
  open trash
  set the current view of the front Finder window to list view
  activate
end tell
]]
  end,
  ["ScreenSaver"] = function()
    hs.osascript.applescript 'tell application "ScreenSaverEngine" to run'
  end,
}
