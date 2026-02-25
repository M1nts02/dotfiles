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
      hs.execute "open -a /Applications/Ghostty.app"
    end,
  },
  -- Finder
  { singleKey("e", "Finder"), Actions["Finder"] },
  { singleKey("`", "Dock"), Actions["Dock"] },
  { singleKey("1", "Brightness Down"), Actions["Brightness Down"], { keep = true } },
  { singleKey("2", "Brightness Up"), Actions["Brightness Up"], { keep = true } },
  { singleKey("3", "Misson Control"), hs.spaces.openMissionControl },
  { singleKey("4", "Caps Lock"), Actions["Caps Lock"], { keep = true } },
  { singleKey("5", "Illumination Down"), Actions["Illumination Down"], { keep = true } },
  { singleKey("6", "Illumination Up"), Actions["Illumination Up"], { keep = true } },
  { singleKey("7", "Prev"), Actions["Prev"], { keep = true } },
  { singleKey("8", "Play"), Actions["Play"], { keep = true } },
  { singleKey("9", "Next"), Actions["Next"], { keep = true } },
  { singleKey("0", "Mute Toggle"), Actions["Mute Toggle"], { keep = true } },
  { singleKey("-", "Volume Down"), Actions["Volume Down"], { keep = true } },
  { singleKey("=", "Volume Up"), Actions["Volume Up"], { keep = true } },
  { singleKey("q", "Quit"), function() end },
}, {
  helper = [[

     [e]: Finder              [g]: Ghostty             [s]: Screenshot 

     [1]: Brightness Down     [2]: Brightness Up       [3]: Misson Control

     [4]: Caps Lock           [5]: Illumination Down   [6]: Illumination Up

     [7]: Prev                [8]: Play                [9]: Next

     [0]: Mute                [-]: Volume Down         [=]: Volume Up

     [`]: Dock
                                                                              ]],
})

hs.hotkey.bind({ "cmd" }, "`", function()
  Menu.color = Utils.get_helper_color()
  run "Main Menu"
end)
