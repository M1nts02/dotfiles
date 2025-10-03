local M = {}
M.__index = M

M.helperEntryEachLine = 5
M.helperEntryLengthInChar = 20
M.helperFormat = { atScreenEdge = 2, textFont = "Courier", textSize = 20 }
M.showBindHelper = true
M.helperModifierMapping = {
  command = "⌘",
  control = "⌃",
  option = "⌥",
  shift = "⇧",
}

M.color = hs.execute "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode'"
      == "true\n"
    and {
      strokeColor = { white = 0.05, alpha = 0.9 },
      fillColor = { white = 0.05, alpha = 0.9 },
      textColor = { white = 0.5, alpha = 1 },
    }
  or {
    strokeColor = { white = 0.95, alpha = 0.9 },
    fillColor = { white = 0.95, alpha = 0.9 },
    textColor = { white = 0.5, alpha = 1 },
  }

local menus = {} -- all menu
local previousHelperID = nil -- used by next model to close previous helper

local function killHelper()
  hs.alert.closeSpecific(previousHelperID)
end

local function modalBind(modal, items, o)
  o.key_len = 0
  for _, map in pairs(items) do
    local key = map[1]
    local func = map[2]
    local opts = map[3] or {}
    o.key_len = o.key_len > #key[2] and o.key_len or #key[2]
    modal:bind(key[1], key[2], function()
      if opts.keep ~= true then
        modal:exit()
        killHelper()
      end
      func()
    end)
  end

  modal:bind(nil, "escape", function()
    modal:exit()
    killHelper()
  end)
end

-- this function is used by helper to display
-- appropriate 'shift + key' bindings
-- it turns a lower key to the corresponding
-- upper key on keyboard
local function keyboardUpper(key)
  -- stylua: ignore start
  local upperTable = {
    a = "A", b = "B", c = "C", d = "D", e = "E", f = "F", g = "G", h = "H", i = "I", j = "J", k = "K", l = "L", m = "M",
    n = "N", o = "O", p = "P", q = "Q", r = "R", s = "S", t = "T", u = "U", v = "V", w = "W", x = "X", y = "Y", z = "Z",
    ["`"] = "~", ["1"] = "!", ["2"] = "@", ["3"] = "#", ["4"]  = "$", ["5"] = "%", ["6"] = "^", ["7"] = "&", ["8"] = "*", ["9"] = "(", ["0"] = ")",
    ["-"] = "_", ["="] = "+", ["["] = "}", ["]"] = "}", ["\\"] = "|", [";"] = ":", ["'"] = '"', [","] = "<", ["."] = ">", ["/"] = "?",
  }
  -- stylua: ignore end
  local uppperKey = upperTable[key]
  if uppperKey then
    return uppperKey
  else
    return key
  end
end

local function showHelper(helper, helperFormat)
  if helperFormat == nil then
    helperFormat = {}
  end

  for k, v in pairs(M.helperFormat) do
    if helperFormat[k] == nil then
      helperFormat[k] = v
    end
  end

  helperFormat.strokeColor = M.color.strokeColor
  helperFormat.fillColor = M.color.fillColor
  helperFormat.textColor = M.color.textColor

  previousHelperID = hs.alert.show(helper, helperFormat, true)
  print("字体颜色" .. helperFormat.textColor.white)
end

function M.add(name, items, opts)
  if opts == nil then
    opts = {}
  end

  menus[name] = {
    items = items,
    opts = opts,
  }
end

function M.run(name)
  local menu = menus[name]
  if menu == nil then
    return
  end

  local modal = hs.hotkey.modal.new()

  modalBind(modal, menu.items, menu.opts)
  modal:enter()
  killHelper()

  local helper = "\n"
  if menu.opts.helper == nil then
    for _, map in pairs(menu.items) do
      local key = map[1]
      local line = string.format("   %-" .. menu.opts.key_len .. "s   %s   \n", key[2], key[3])
      helper = helper .. line
    end
  else
    helper = menu.opts.helper
  end

  showHelper(helper, menu.opts.helperFormat)
end

-- returns a table of modifiers and keys and names
function M.singleKey(key, name)
  local mod = {}
  if key == keyboardUpper(key) and string.len(key) == 1 then
    mod = { "shift" }
    key = string.lower(key)
  end

  if name then
    return { mod, key, name }
  else
    return { mod, key, "no name" }
  end
end

return M
