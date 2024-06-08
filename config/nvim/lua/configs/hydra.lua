local M = {}

local rg = {}

rg["window"] = {
  name = "Window",
  body = "<Space>w",
  mode = "n",
  config = {
    color = "pink",
    invoke_on_body = false,
  },
  heads = {
    { "l", "<C-w>l", { desc = "" } },
    { "h", "<C-w>h", { desc = "" } },
    { "k", "<C-w>k", { desc = "" } },
    { "j", "<C-w>j", { desc = "" } },
    { "v", "<C-w>v", { desc = "VSplit" } },
    { "s", "<C-w>s", { desc = "Split" } },
    { "q", "<C-w>q", { desc = "Quit" } },
    { "+", "<C-w>+", { desc = "Height+" } },
    { "-", "<C-w>-", { desc = "Height-" } },
    { ">", "<C-w>>", { desc = "Width+" } },
    { "<", "<C-w><", { desc = "Width-" } },
    { "<Esc>", nil, { exit = true, nowait = true } },
    { "<C-c>", nil, { exit = true, nowait = true } },
  },
}

function M.config()
  local Hydra = require "hydra"
  for _, v in pairs(rg) do
    Hydra(v)
  end
end

return M
