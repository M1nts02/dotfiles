local add = Menu.add
local run = Menu.run
local singleKey = Menu.singleKey

add("Main Menu", {
  { -- Screenshot
    singleKey("s", "Screenshot"),
    function()
      run "Screenshot"
    end,
  },
  -- Automator
  {
    singleKey("a", "Automator"),
    function()
      hs.application.launchOrFocus "/System/Applications/Automator.app"
    end,
  },
  -- Ghostty
  {
    singleKey("g", "Ghostty"),
    function()
      hs.execute "open -a Ghostty"
    end,
  },
  -- Finder
  { singleKey("e", "Finder"), actions["Finder"].run },
  { singleKey("f3", "Misson Control"), hs.spaces.openMissionControl },
  { singleKey("f11", "Volume Down"), actions["Volume Down"].run, { keep = true } },
  { singleKey("f12", "Volume Up"), actions["Volume Up"].run, { keep = true } },
  { singleKey("f10", "Mute Toggle"), actions["Mute Toggle"].run, { keep = true } },
  { singleKey("f9", "Next"), actions["Next"].run, { keep = true } },
  { singleKey("f7", "Prev"), actions["Prev"].run, { keep = true } },
  { singleKey("f8", "Play"), actions["Play"].run, { keep = true } },
  { singleKey("q", "Quit"), function() end },
  { singleKey("1", "Move to Space 1"), actions["FlashSpace Move to 1"].run },
  { singleKey("2", "Move to Space 2"), actions["FlashSpace Move to 2"].run },
  { singleKey("3", "Move to Space 3"), actions["FlashSpace Move to 3"].run },
  { singleKey("4", "Move to Space 4"), actions["FlashSpace Move to 4"].run },
  { singleKey("5", "Move to Space 5"), actions["FlashSpace Move to 5"].run },
  { singleKey("6", "Move to Space 6"), actions["FlashSpace Move to 6"].run },
  { singleKey("7", "Move to Space 7"), actions["FlashSpace Move to 7"].run },
  { singleKey("8", "Move to Space 8"), actions["FlashSpace Move to 8"].run },
  { singleKey("9", "Move to Space 9"), actions["FlashSpace Move to 9"].run },
}, {
  helper = [[

     [e]: Finder          [g]: Ghostty         [a]: Automator

     [F7]: Prev           [F8]: Play           [F9]: Next

     [F10]: Mute          [F11]: Volume Down   [F12]: Volume Up

     [F3]: Misson Control [1-9]: Move Space    [s]: Screenshot
                                                                      ]],
})

hs.hotkey.bind({ "alt" }, "`", function()
  Menu.color = utils.get_helper_color()
  run "Main Menu"
end)
