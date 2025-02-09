local utils = require "modules.utils"
local config = vim.fn.stdpath "config"

-- default global value
vim.g.transparent = false

-- Get path of custom file
local custom_path = config .. "/lua/custom.lua"
local template_path = config .. "/template/custom_default.lua"

-- Command for open custom file
vim.api.nvim_create_user_command("CustomOpen", function()
  vim.cmd("e " .. custom_path)
end, {
  desc = "Open custom file",
})

-- Load custom file
if not vim.uv.fs_stat(custom_path) then
  -- Create and open custom.lua
  utils.copy_file(template_path, custom_path)
end

require "custom"
