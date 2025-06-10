local utils = require "modules.utils"
local dm = require "debugmaster"

local setmap = utils.setmap

setmap {
  { { "n", "v" }, "<Space>d", dm.mode.toggle, { nowait = true, desc = "Debug Mode" } },
  { "t", "<C-/>", "<C-\\><C-n>", { desc = "Exit terminal mode" } },
}
