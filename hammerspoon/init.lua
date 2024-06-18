hs.loadSpoon "RecursiveBinder"

spoon.RecursiveBinder.escapeKey = { {}, "escape" } -- Press escape to abort

spoon.RecursiveBinder.helperFormat = {
  atScreenEdge = 0,
  textStyle = { font = { name = "RecMonoLinear Nerd Font", size = 16 } },
}

local menu = require "menu"
hs.hotkey.bind(menu.mods, menu.key, spoon.RecursiveBinder.recursiveBind(menu.message))

-- Switch input method into English
-- local sourceID = "com.apple.inputmethod.SCIM.ITABC"
-- hs.hotkey.bind("control", "space", function()
--   local enid = "com.apple.keylayout.ABC"
--   local sid = hs.keycodes.currentSourceID()
--   if sid == enid then
--     hs.keycodes.currentSourceID(sourceID)
--   else
--     sourceID = sid
--     hs.keycodes.currentSourceID(enid)
--   end
-- end)

-- require "auto-switch-input-method"
