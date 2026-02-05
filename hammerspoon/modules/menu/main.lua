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
  -- AppVolume
  {
    singleKey("v", "AppVolume"),
    function()
      hs.application.launchOrFocus "/Applications/AppVolume.app"
    end,
  },
  -- Ghostty
  {
    singleKey("g", "Ghostty"),
    function()
      hs.execute "open -a /Applications/Ghostty.app"
    end,
  },
  -- Finder
  { singleKey("e", "Finder"), Actions["Finder"].run },
  { singleKey("d", "Dock"), Actions["Dock"].run },
  { singleKey("1", "Brightness Down"), Actions["Brightness Down"].run, { keep = true } },
  { singleKey("2", "Brightness Up"), Actions["Brightness Up"].run, { keep = true } },
  { singleKey("3", "Misson Control"), hs.spaces.openMissionControl },
  { singleKey("4", "Caps Lock"), Actions["Caps Lock"].run, { keep = true } },
  { singleKey("5", "Illumination Down"), Actions["Illumination Down"].run, { keep = true } },
  { singleKey("6", "Illumination Up"), Actions["Illumination Up"].run, { keep = true } },
  { singleKey("7", "Prev"), Actions["Prev"].run, { keep = true } },
  { singleKey("8", "Play"), Actions["Play"].run, { keep = true } },
  { singleKey("9", "Next"), Actions["Next"].run, { keep = true } },
  { singleKey("0", "Mute Toggle"), Actions["Mute Toggle"].run, { keep = true } },
  { singleKey("-", "Volume Down"), Actions["Volume Down"].run, { keep = true } },
  { singleKey("=", "Volume Up"), Actions["Volume Up"].run, { keep = true } },
  { singleKey("q", "Quit"), function() end },
}, {
  helper = [[

     [e]: Finder              [g]: Ghostty             [v]: AppVolume

     [1]: Brightness Down     [2]: Brightness Up       [3]: Misson Control

     [4]: Caps Lock           [5]: Illumination Down   [6]: Illumination Up

     [7]: Prev                [8]: Play                [9]: Next

     [0]: Mute                [-]: Volume Down         [=]: Volume Up

     [s]: Screenshot          [d]: Dock
                                                                              ]],
})

hs.hotkey.bind({ "cmd", "ctrl" }, "e", function()
  Menu.color = Utils.get_helper_color()
  run "Main Menu"
end)
