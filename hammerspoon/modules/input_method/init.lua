-- Switch input method into English
local sourceID = "com.apple.inputmethod.SCIM.ITABC"
hs.hotkey.bind("control", "space", function()
  local enid = "com.apple.keylayout.ABC"
  local sid = hs.keycodes.currentSourceID()
  if sid == enid then
    hs.keycodes.currentSourceID(sourceID)
  else
    sourceID = sid
    hs.keycodes.currentSourceID(enid)
  end
end)

require "modules.input_method.auto-switch-input-method"
