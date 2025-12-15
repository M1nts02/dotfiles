local add = Menu.add
local run = Menu.run
local singleKey = Menu.singleKey

add("Main Menu", {
  { singleKey("1", "Move to Space 1"), actions["FlashSpace Move to 1"].run },
  { singleKey("2", "Move to Space 2"), actions["FlashSpace Move to 2"].run },
  { singleKey("3", "Move to Space 3"), actions["FlashSpace Move to 3"].run },
  { singleKey("4", "Move to Space 4"), actions["FlashSpace Move to 4"].run },
  { singleKey("5", "Move to Space 5"), actions["FlashSpace Move to 5"].run },
  { singleKey("6", "Move to Space 6"), actions["FlashSpace Move to 6"].run },
  { singleKey("7", "Move to Space 7"), actions["FlashSpace Move to 7"].run },
  { singleKey("8", "Move to Space 8"), actions["FlashSpace Move to 8"].run },
  { singleKey("9", "Move to Space 9"), actions["FlashSpace Move to 9"].run },
  { -- Screenshot
    singleKey("s", "Screenshot"),
    function()
      run "Screenshot"
    end,
  },
  -- Ghostty
  {
    singleKey("g", "Ghostty"),
    function()
      utils.flashSpaceMoveSpace { bundleID = "com.mitchellh.ghostty", spaceName = utils.flashSpaceGetWorkspace() }
      hs.execute "open -a Ghostty -n"
    end,
  },
  -- Finder
  { singleKey("e", "Finder"), actions["Finder"].run },
  -- Rimer Switcher
  { singleKey("w", "Rime"), actions["Rime"].run },
  { singleKey("o", "Maximize"), actions["Window Maximize"].run, { keep = true } },
  { singleKey("f", "Center"), actions["Window Center"].run, { keep = true } },
  { singleKey("k", "Up"), actions["Window Up"].run, { keep = true } },
  { singleKey("j", "Down"), actions["Window Down"].run, { keep = true } },
  { singleKey("h", "Left"), actions["Window Left"].run, { keep = true } },
  { singleKey("l", "Right"), actions["Window Right"].run, { keep = true } },
  { singleKey("d", "Default"), actions["Window Default"].run, { keep = true } },
  { singleKey("t", "Float"), actions["FlashSpace Float Toggle"].run },
  { singleKey("u", "Window Upper Left"), actions["Window Upper Left"].run, { keep = true } },
  { singleKey("i", "Window Upper Right"), actions["Window Upper Right"].run, { keep = true } },
  { singleKey("n", "Window Lower Left"), actions["Window Lower Left"].run, { keep = true } },
  { singleKey("m", "Window Lower Right"), actions["Window Lower Right"].run, { keep = true } },
  { singleKey("f3", "Misson Control"), hs.spaces.openMissionControl },
  { singleKey("f11", "Volume Down"), actions["Volume Down"].run, { keep = true } },
  { singleKey("f12", "Volume Up"), actions["Volume Up"].run, { keep = true } },
  { singleKey("f10", "Mute Toggle"), actions["Mute Toggle"].run, { keep = true } },
  { singleKey("f9", "Next"), actions["Next"].run, { keep = true } },
  { singleKey("f7", "Prev"), actions["Prev"].run, { keep = true } },
  { singleKey("f8", "Play"), actions["Play"].run, { keep = true } },
  { singleKey("q", "Quit"), function() end },
}, {
  helper = [[


     [e]: Finder          [g]: Ghostty         [s]: Screenshot      [w]: Rime

     [h]: Left            [l]: Right           [k]: Up              [j]: Down

     [u]: Upper Left      [i]: Upper Right     [n]: Lower Left      [m]: Lower Right

     [f]: Center          [d]: Default         [o]: Maximize

     [t]: Float           [1-9]: Move to Space

                                                                                        ]],
})

hs.hotkey.bind({ "cmd" }, "`", function()
  Menu.color = utils.get_helper_color()
  run "Main Menu"
end)
