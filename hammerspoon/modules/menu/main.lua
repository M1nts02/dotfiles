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
  -- Ghostty
  {
    singleKey("g", "Ghostty"),
    function()
      hs.execute "open -a Ghostty -n"
    end,
  },
  -- Finder
  { singleKey("e", "Finder"), actions["Finder"].run },
  { singleKey("o", "Maximize"), actions["Window Maximize"].run, { keep = true } },
  { singleKey("c", "Center"), actions["Window Center"].run, { keep = true } },
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


     [e]: Finder          [g]: Ghostty         [s]: Screenshot

     [c]: Center          [o]: Maximize

                                                                      ]],
})

hs.hotkey.bind({ "cmd" }, "`", function()
  Menu.color = utils.get_helper_color()
  run "Main Menu"
end)
