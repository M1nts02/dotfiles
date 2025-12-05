local terminal = "/Applications/Ghostty.app/Contents/MacOS/ghostty --window-decoration=none"
local utils = require "utils"

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
    hs.execute(
      "nohup "
        .. terminal
        .. " --background-opacity=0.8"
        .. " --title=Yazi"
        .. " --keybind=cmd+t=unbind"
        .. " --keybind=cmd+n=unbind"
        .. " --keybind=cmd+d=unbind"
        .. " --keybind=cmd+shift+d=unbind"
        .. " -e yazi > /tmp/yazi.log &",
      true
    )
  end,
  ["Reload"] = function()
    hs.reload()
    hs.notify.new():title("Reload"):subTitle("Hammerspoon reload done!"):send()
  end,
  ["Dark Mode"] = function()
    hs.osascript.applescript [[
tell application "System Events"
    tell appearance preferences 
        set dark mode to not dark mode 
    end tell
end tell
    ]]
  end,
  ["Finder"] = function()
    hs.application.launchOrFocus "/System/Library/CoreServices/Finder.app"
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
  ["FlashSpace Move to 1"] = function()
    utils.flashSpace_Move_space(1)
  end,
  ["FlashSpace Move to 2"] = function()
    utils.flashSpace_Move_space(2)
  end,
  ["FlashSpace Move to 3"] = function()
    utils.flashSpace_Move_space(3)
  end,
  ["FlashSpace Move to 4"] = function()
    utils.flashSpace_Move_space(4)
  end,
  ["FlashSpace Move to 5"] = function()
    utils.flashSpace_Move_space(5)
  end,
  ["FlashSpace Move to 6"] = function()
    utils.flashSpace_Move_space(6)
  end,
  ["FlashSpace Move to 7"] = function()
    utils.flashSpace_Move_space(7)
  end,
  ["FlashSpace Move to 8"] = function()
    utils.flashSpace_Move_space(8)
  end,
  ["FlashSpace Move to 9"] = function()
    utils.flashSpace_Move_space(9)
  end,
  ["FlashSpace space control"] = function()
    hs.execute("flashspace open-space-control", true)
  end,
}
