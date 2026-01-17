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
  -- Workspace
  {
    singleKey("1", "Send App to Space 1"),
    function()
      Space.sendSpace "1"
    end,
  },
  {
    singleKey("2", "Send App to Space 2"),
    function()
      Space.sendSpace "2"
    end,
  },
  {
    singleKey("3", "Send App to Space 3"),
    function()
      Space.sendSpace "3"
    end,
  },
  {
    singleKey("4", "Send App to Space 4"),
    function()
      Space.sendSpace "4"
    end,
  },
  {
    singleKey("5", "Send App to Space 5"),
    function()
      Space.sendSpace "5"
    end,
  },
  {
    singleKey("6", "Send App to Space 6"),
    function()
      Space.sendSpace "6"
    end,
  },
  {
    singleKey("7", "Send App to Space 7"),
    function()
      Space.sendSpace "7"
    end,
  },
  {
    singleKey("8", "Send App to Space 8"),
    function()
      Space.sendSpace "8"
    end,
  },
  {
    singleKey("9", "Send App to Space 9"),
    function()
      Space.sendSpace "9"
    end,
  },
  { singleKey("q", "Quit"), function() end },
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
