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
      utils.flashSpaceMoveSpace("com.mitchellh.ghostty", utils.flashSpaceGetWorkspace())
      hs.execute "open -a Ghostty -n"
    end,
  },
  -- Finder
  {
    singleKey("f", "Finder"),
    function()
      hs.application.launchOrFocus "/System/Library/CoreServices/Finder.app"
    end,
  },
  -- Rimer Switcher
  {
    singleKey("e", "Rime"),
    function()
      hs.keycodes.currentSourceID "im.rime.inputmethod.Squirrel.Hans"
      hs.eventtap.keyStroke({ "control", "shift" }, "f4")
    end,
  },
  {
    singleKey("o", "Maximize"),
    actions["Window Maximize"].run,
    { keep = true },
  },
  {
    singleKey("c", "Center"),
    actions["Window Center"].run,
    { keep = true },
  },
  {
    singleKey("k", "Up"),
    actions["Window Up"].run,
    { keep = true },
  },
  {
    singleKey("j", "Down"),
    actions["Window Down"].run,
    { keep = true },
  },
  {
    singleKey("h", "Left"),
    actions["Window Left"].run,
    { keep = true },
  },
  {
    singleKey("l", "Right"),
    actions["Window Right"].run,
    { keep = true },
  },
  {
    singleKey("t", "Top"),
    actions["Window Top"].run,
    { keep = true },
  },
  {
    singleKey("u", "Window Upper Left"),
    actions["Window Upper Left"].run,
    { keep = true },
  },
  {
    singleKey("i", "Window Upper Right"),
    actions["Window Upper Right"].run,
    { keep = true },
  },
  {
    singleKey("n", "Window Lower Left"),
    actions["Window Lower Left"].run,
    { keep = true },
  },
  {
    singleKey("m", "Window Lower Right"),
    actions["Window Lower Right"].run,
    { keep = true },
  },
  {
    singleKey("f3", "Misson Control"),
    function()
      hs.spaces.openMissionControl()
    end,
  },
  {
    singleKey("f11", "Volume Down"),
    function()
      local current = hs.audiodevice.defaultOutputDevice():volume()
      local newVolume = math.min(current - 5, 100)
      hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
    end,
    { keep = true },
  },
  {
    singleKey("f12", "Volume Up"),
    function()
      local current = hs.audiodevice.defaultOutputDevice():volume()
      local newVolume = math.min(current + 5, 100)
      hs.audiodevice.defaultOutputDevice():setVolume(newVolume)
    end,
    { keep = true },
  },
  {
    singleKey("f10", "Mute Toggle"),
    function()
      local device = hs.audiodevice.defaultOutputDevice()
      local muted = device:muted()
      device:setMuted(not muted)
    end,
    { keep = true },
  },
  {
    singleKey("f9", "Next"),
    function()
      hs.eventtap.event.newSystemKeyEvent("NEXT", true):post()
      hs.eventtap.event.newSystemKeyEvent("NEXT", false):post()
    end,
    { keep = true },
  },
  {
    singleKey("f7", "Prev"),
    function()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", true):post()
      hs.eventtap.event.newSystemKeyEvent("PREVIOUS", false):post()
    end,
    { keep = true },
  },
  {
    singleKey("f8", "Play"),
    function()
      hs.eventtap.event.newSystemKeyEvent("PLAY", true):post()
      hs.eventtap.event.newSystemKeyEvent("PLAY", false):post()
    end,
    { keep = true },
  },
  {
    singleKey("r", "Reload"),
    function()
      hs.reload()
      hs.notify.new():title("Reload"):subTitle("Hammerspoon reload done!"):send()
    end,
  },
  {
    singleKey("q", "Quit"),
    function() end,
  },
}, {
  helper = [[


     [f]: Finder          [g]: Ghostty         [s]: Screenshot      [e]: Rime

     [h]: Left            [l]: Right           [k]: Up              [j]: Down

     [u]: Upper Left      [i]: Upper Right     [n]: Lower Left      [m]: Lower Right

     [c]: Center          [t]: Top             [o]: Maximize

     [r]: Reload          [1-9]: Move to Space

                                                                                        ]],
  helperFormat = {
    atScreenEdge = 0,
    radius = 10,
  },
})

hs.hotkey.bind({ "cmd" }, "`", function()
  Menu.color = utils.get_helper_color()
  run "Main Menu"
end)
