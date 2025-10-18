local menu = require "modules.menu.menu"

imageObj = hs.image.imageFromPath(os.getenv "HOME" .. "/.hammerspoon/icons/ena.png")

menu.helperFormat = {
  atScreenEdge = 0,
  radius = 0,
  textStyle = { font = { name = "Monaco", size = 14 } },
}

local add = menu.add
local run = menu.run
local singleKey = menu.singleKey

add("Mpd", {
  {
    singleKey("space", "Toggle"),
    function()
      hs.execute("mpc toggle", true)
    end,
    { keep = true },
  },
  {
    singleKey("]", "Next"),
    function()
      local result = hs.execute("mpc next", true)
      local i = string.find(result, "\n")
      local r = string.sub(result, 1, i)
      hs.notify.new():title("Mpd Next"):subTitle(r):setIdImage(imageObj):contentImage(imageObj):send()
    end,
    { keep = true },
  },
  {
    singleKey("[", "Prev"),
    function()
      local result = hs.execute("mpc prev", true)
      local i = string.find(result, "\n")
      local r = string.sub(result, 1, i)
      hs.notify.new():title("Mpd Prev"):subTitle(r):setIdImage(imageObj):contentImage(imageObj):send()
    end,
    { keep = true },
  },
  {
    singleKey("=", "Volume+"),
    function()
      hs.execute("mpc volume +5", true)
    end,
    { keep = true },
  },
  {
    singleKey("-", "Volume-"),
    function()
      hs.execute("mpc volume -5", true)
    end,
    { keep = true },
  },
  {
    singleKey("s", "Stop"),
    function()
      hs.execute("mpc stop", true)
    end,
    { keep = true },
  },
  {
    singleKey("o", "Status"),
    function()
      local result = hs.execute("mpc status", true)
      hs.notify.show("Mpd", "", result)
    end,
    { keep = true },
  },
  {
    singleKey(".", "Random"),
    function()
      local result = hs.execute("mpc random", true)
      local r = string.find(result, "random: on") == nil and "Random: Off" or "Random: On"
      hs.notify.show("Mpd", "", r)
    end,
    { keep = true },
  },
  {
    singleKey(",", "Single"),
    function()
      local result = hs.execute("mpc single", true)
      local r = string.find(result, "single: on") == nil and "Single: Off" or "Single: On"
      hs.notify.show("Mpd", "", r)
    end,
    { keep = true },
  },
  {
    singleKey("l", "Repeat"),
    function()
      local result = hs.execute("mpc repeat", true)
      local r = string.find(result, "repeat: on") == nil and "Repeat: Off" or "Repeat: On"
      hs.notify.show("Mpd", "", r)
    end,
    { keep = true },
  },
  {
    singleKey("u", "Update"),
    function()
      hs.execute("mpc update", true)
    end,
    { keep = true },
  },
  {
    singleKey("r", "Restart"),
    function()
      hs.execute("brew services stop mpd", true)
      hs.execute("brew services start mpd", true)
    end,
    { keep = true },
  },
  {
    singleKey("q", "Quit"),
    function() end,
  },
}, {
  helper = [[

   [,]: Single [.]: Random  [l]: Repeat
   [s]: Stop   [u]: Update  [r]: Restart
   [o]: Status
                                         ]],
  helperFormat = {
    atScreenEdge = 1,
    textStyle = { font = { name = "Monaco", size = 13 } },
  },
})

hs.hotkey.bind({ "alt" }, "d", function()
  run "Mpd"
end)
