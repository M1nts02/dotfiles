local singleKey = Menu.singleKey

Menu.add("Main Menu", {
  { singleKey("1", "Illumination Down"), function() Utils.MediaKeyEvent "ILLUMINATION_DOWN" end, { keep = true } },
  { singleKey("2", "Illumination Up"), function() Utils.MediaKeyEvent "ILLUMINATION_UP" end, { keep = true } },
  { singleKey("4", "Screenshot"), function() Menu.run "Screenshot" end },
  { singleKey("`", "Rime"), Utils.rime_switcher },
  { singleKey("e", "Finder"), function() hs.application.launchOrFocus "/System/Library/CoreServices/Finder.app" end },
  { singleKey("q", "Quit"), function() end },
  { singleKey("r", "Reload"), function() hs.reload() end },
}, {
  helper = [[

     [e]: Finder              [4]: Screenshot          [`]: Rime

     [r]: Reload              [1/2]: ⌨️
                                                                        ]],
})

hs.hotkey.bind({ "cmd" }, "`", function()
  Menu.color = Utils.get_helper_color()
  Menu.run "Main Menu"
end)
