-- Open cache file
vim.api.nvim_create_user_command("CustomOpen", function()
  vim.cmd("e " .. CachePath)
end, {
  desc = "Open cache file",
})

vim.api.nvim_create_user_command("Settings", function()
  local actions = require "actions"

  local items = {}
  local f = ""
  for _, v in pairs(actions) do
    if type(v.flag) == "string" then
      f = vim.g[v.flag]
    elseif type(v.flag) == "function" then
      f = v.flag()
    else
      f = false
    end
    table.insert(items, "[" .. (f and "✔︎" or " ") .. "] " .. v.desc)
  end

  vim.ui.select(items, {
    prompt = "",
  }, function(_, idx)
    local act = actions[idx]

    if act == nil then
      return
    end

    act.action()
  end)
end, {
  desc = "Settings",
})
