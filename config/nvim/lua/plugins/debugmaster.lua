local utils = require "modules.utils"
local dm = require "debugmaster"
local menu = require "nvim-menu"

local setmap = utils.setmap

setmap {
  {
    { "n", "v" },
    "<Space>d",
    function()
      dm.mode.toggle()
      if require("debugmaster.debug.mode").is_active() then
        menu.open "Debug"
      else
        menu.close()
      end
    end,
    { nowait = true, desc = "Debug Mode" },
  },
  { "t", "<C-/>", "<C-\\><C-n>", { desc = "Exit terminal mode" } },
}

menu.add("Debug", {
  config = {
    format = "${KEY} ${DESC}",
    position = "BR",
    type = "helper",
    quit = false,
  },
  items = {
    { { key = "t", desc = "Breakpoint" } },
    { { key = "H", desc = "Help" } },
    { { key = "u", desc = "Side panel" } },
    { { key = "c", desc = "Start" } },
    { { key = "o", desc = "Step over" } },
    { { key = "m", desc = "Step into" } },
    { { key = "q", desc = "Step out" } },
    { { key = "r", desc = "Run to cursor" } },
  },
})
