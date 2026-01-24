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
  { -- Space
    singleKey("w", "Move Space"),
    function()
      run "Space"
    end,
  },
  -- Automator
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
      hs.execute "open -a Ghostty"
    end,
  },
  -- Finder
  { singleKey("e", "Finder"), actions["Finder"].run },
  { singleKey("d", "Finder"), actions["Dock"].run },
  { singleKey("1", "Brightness Down"), actions["Brightness Down"].run, { keep = true } },
  { singleKey("2", "Brightness Up"), actions["Brightness Up"].run, { keep = true } },
  { singleKey("3", "Misson Control"), hs.spaces.openMissionControl },
  { singleKey("4", "Caps Lock"), actions["Caps Lock"].run, { keep = true } },
  { singleKey("5", "Illumination Down"), actions["Illumination Down"].run, { keep = true } },
  { singleKey("6", "Illumination Up"), actions["Illumination Up"].run, { keep = true } },
  { singleKey("7", "Prev"), actions["Prev"].run, { keep = true } },
  { singleKey("8", "Play"), actions["Play"].run, { keep = true } },
  { singleKey("9", "Next"), actions["Next"].run, { keep = true } },
  { singleKey("0", "Mute Toggle"), actions["Mute Toggle"].run, { keep = true } },
  { singleKey("-", "Volume Down"), actions["Volume Down"].run, { keep = true } },
  { singleKey("=", "Volume Up"), actions["Volume Up"].run, { keep = true } },
  { singleKey("q", "Quit"), function() end },
}, {
  helper = [[

     [e]: Finder              [g]: Ghostty             [v]: AppVolume

     [1]: Brightness Down     [2]: Brightness Up       [3]: Misson Control

     [4]: Caps Lock           [5]: Illumination Down   [6]: Illumination Up

     [7]: Prev                [8]: Play                [9]: Next

     [0]: Mute                [-]: Volume Down         [=]: Volume Up

     [w]: Space               [s]: Screenshot          [d]: Dock
                                                                              ]],
})

hs.hotkey.bind({ "cmd", "ctrl" }, "e", function()
  Menu.color = utils.get_helper_color()
  run "Main Menu"
end)
