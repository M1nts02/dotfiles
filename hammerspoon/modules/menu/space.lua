local add = Menu.add
local singleKey = Menu.singleKey

add("Space", {
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
})
