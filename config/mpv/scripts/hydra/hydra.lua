local M = {}
local mp = require "mp"
local ass = mp.create_osd_overlay "ass-events"
local base_ass = "{\\an2}{\\shad0}{\\b1}"

-- Add keybinds
add_keybinds = function(opt, keys)
  local map = opt
  if keys ~= nil and keys ~= {} then
    for _, v in pairs(keys) do
      map = map[v][2]
    end
  else
    keys = {}
  end

  for key, val in pairs(map) do
    local t = type(val[2])
    local func = function() end

    if t == "string" then
      func = function()
        mp.command(val[2])
        if val["keep"] ~= true then
          remove_keybinds(opt, keys)
          ass:remove()
        end
      end
    elseif t == "function" then
      func = function()
        val[2]()
        if val["keep"] ~= true then
          remove_keybinds(opt, keys)
          ass:remove()
        end
      end
    elseif t == "table" then
      func = function()
        if val["keep"] ~= true then
          remove_keybinds(opt, keys)
          table.insert(keys, key)
          show_keys(opt, keys)
        end
      end
    end

    mp.add_forced_key_binding(key, "hydra_" .. key .. "_" .. val[1], func, { repeatable = true })
  end

  mp.add_forced_key_binding("ESC", "hydra_esc", function()
    remove_keybinds(opt, keys)
    ass:remove()
  end, { repeatable = true })

  mp.add_forced_key_binding("BS", "hydra_back", function()
    remove_keybinds(opt, keys)
    table.remove(keys, #keys)
    show_keys(opt, keys)
  end, { repeatable = true })
end

-- Remove keybinds
remove_keybinds = function(opt, keys)
  local map = opt
  if keys ~= nil then
    for _, v in pairs(keys) do
      map = map[v][2]
    end
  end

  for key, val in pairs(map) do
    mp.remove_key_binding("hydra_" .. key .. "_" .. val[1])
  end

  mp.remove_key_binding "hydra_esc"
  mp.remove_key_binding "hydra_back"
end

-- Update ass data
update_data = function(opt, keys)
  local map = opt
  if keys ~= nil then
    for _, v in pairs(keys) do
      map = map[v][2]
    end
  end

  local data = base_ass
  local i = 0
  local max_len = 6

  for key, val in pairs(map) do
    if i == 0 then
      data = data .. key .. ":" .. val[1]
      i = i + 1
    elseif i < max_len then
      data = data .. "     " .. key .. ":" .. val[1]
      i = i + 1
    else
      data = data .. "\\N" .. key .. ":" .. val[1]
      i = 1
    end
  end
  return data
end

show_keys = function(table, keys)
  local data = update_data(table, keys)
  ass.data = data
  add_keybinds(table, keys)
  ass:update()
end

M.set = function(table, keys)
  show_keys(table, keys)
end

return M
