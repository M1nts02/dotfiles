local M = {}
local bind = hs.hotkey.bind

hs.window.animationDuration = 0

function M.WindowMaximize()    hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.99 }       end
function M.WindowCenter()      hs.window.focusedWindow():moveToUnit { 0.175, 0.125, 0.65, 0.75 }       end
function M.WindowDefault()     hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.65, 0.99 }       end
function M.WindowLeft()        hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.4925, 0.99 }     end
function M.WindowRight()       hs.window.focusedWindow():moveToUnit { 0.5025, 0.005, 0.4925, 0.99 }    end
function M.WindowTop()         hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.99, 0.4925 }     end
function M.WindowBottom()      hs.window.focusedWindow():moveToUnit { 0.005, 0.5025, 0.99, 0.4925 }    end
function M.WindowTopLeft()     hs.window.focusedWindow():moveToUnit { 0.005, 0.005, 0.4925, 0.4925 }   end
function M.WindowTopRight()    hs.window.focusedWindow():moveToUnit { 0.5025, 0.005, 0.4925, 0.4925 }  end
function M.WindowBottomLeft()  hs.window.focusedWindow():moveToUnit { 0.005, 0.5025, 0.4925, 0.4925 }  end
function M.WindowBottomRight() hs.window.focusedWindow():moveToUnit { 0.5025, 0.5025, 0.4925, 0.4925 } end

bind({ "ctrl", "cmd" }, "o", M.WindowMaximize   )
bind({ "ctrl", "cmd" }, "c", M.WindowCenter     )
bind({ "ctrl", "cmd" }, "y", M.WindowDefault    )
bind({ "ctrl", "cmd" }, "h", M.WindowLeft       )
bind({ "ctrl", "cmd" }, "l", M.WindowRight      )
bind({ "ctrl", "cmd" }, "k", M.WindowTop        )
bind({ "ctrl", "cmd" }, "j", M.WindowBottom     )
bind({ "ctrl", "cmd" }, "u", M.WindowTopLeft    )
bind({ "ctrl", "cmd" }, "i", M.WindowTopRight   )
bind({ "ctrl", "cmd" }, "n", M.WindowBottomLeft )
bind({ "ctrl", "cmd" }, "m", M.WindowBottomRight)

return M
