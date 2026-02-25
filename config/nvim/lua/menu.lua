local actions = {
  {
    desc = "Auto pairs",
    flag = function()
      return not vim.g.minipairs_disable
    end,
    action = "AutoPairsToggle",
  },
  {
    desc = "Dark mode",
    flag = "dark",
    action = "DarkMode",
  },
  {
    desc = "Auto Completion",
    flag = "cmp_enable",
    action = "BlinkCmpToggle",
  },
  {
    desc = "Dim",
    flag = "dim",
    action = "DimToggle",
  },
  {
    desc = "Wrap",
    flag = function()
      return vim.opt.wrap:get()
    end,
    action = "WrapToggle",
  },
  {
    desc = "Virtual Text",
    flag = "dianostic_virtualtext",
    action = "VirtualText",
  },
  {
    desc = "Inlay hints",
    flag = "inlay_hints",
    action = "InlayHints",
  },
  {
    desc = "Auto format",
    flag = "enable_autoformat",
    action = "FormatToggle",
  },
}

vim.api.nvim_create_user_command("Settings", function()
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

    if type(act.action) == "function" then
      act.action()
    elseif type(act.action) == "string" then
      vim.cmd(act.action)
    end
  end)
end, {
  desc = "Settings",
})
