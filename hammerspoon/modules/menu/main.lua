local singleKey = Menu.singleKey

Menu.add("Main Menu", {
  { singleKey("s", "Screenshot"), function() Menu.run "Screenshot" end },
  { singleKey("`", "Rime"), Utils.rime_switcher },
  { singleKey("t", "Trash"), require("actions.trash").open_trash },
  { singleKey("z", "Zoxide"), require("actions.choose").zoxide },
  { singleKey("a", "audio"), require('actions.audio').switch_audio_source },
  { singleKey("d", "Disk"), require("actions.disk").show_disk_menu },
  { singleKey("c", "Console"), function() hs.openConsole() end },
  { singleKey("e", "Finder"), function() hs.application.launchOrFocus "/System/Library/CoreServices/Finder.app" end },
  { singleKey("g", "Ghostty"), function() hs.application.launchOrFocus "/Applications/Ghostty.app" end },
  { singleKey("q", "Quit"), function() end },
  { singleKey("r", "Reload"), function() hs.reload() end },
  { singleKey("1", "Assign Group 1"), function() MintTab.assign_group(1) end },
  { singleKey("2", "Assign Group 2"), function() MintTab.assign_group(2) end },
  { singleKey("3", "Assign Group 3"), function() MintTab.assign_group(3) end },
  { singleKey("4", "Assign Group 4"), function() MintTab.assign_group(4) end },
  { singleKey("5", "Assign Group 5"), function() MintTab.assign_group(5) end },
  { singleKey("6", "Assign Group 6"), function() MintTab.assign_group(6) end },
  { singleKey("7", "Assign Group 7"), function() MintTab.assign_group(7) end },
  { singleKey("8", "Assign Group 8"), function() MintTab.assign_group(8) end },
  { singleKey("9", "Assign Group 9"), function() MintTab.assign_group(9) end },
}, {
  helper = [[

     [e]: Finder              [s]: Screenshot          [`]: Rime

     [a]: Audio               [d]: Disk                [z]: Zoxide

     [r]: Reload              [c]: Console             [g]: Ghostty

     [t]: Trash
                                                                        ]],
})

hs.hotkey.bind({ "cmd" }, "`", function()
  Menu.color = Utils.get_helper_color()
  Menu.run "Main Menu"
end)
