local bind = hs.hotkey.bind

bind({ "ctrl", "cmd" }, "o", function() hs.window.focusedWindow():moveToUnit { 0.005,  0.005,  0.99,   0.99   } end) -- Window Maximize
bind({ "ctrl", "cmd" }, "c", function() hs.window.focusedWindow():moveToUnit { 0.175,  0.125,  0.65,   0.75   } end) -- Window Center
bind({ "ctrl", "cmd" }, "y", function() hs.window.focusedWindow():moveToUnit { 0.005,  0.005,  0.65,   0.99   } end) -- Window Default
bind({ "ctrl", "cmd" }, "h", function() hs.window.focusedWindow():moveToUnit { 0.005,  0.005,  0.4925, 0.99   } end) -- Window Left
bind({ "ctrl", "cmd" }, "l", function() hs.window.focusedWindow():moveToUnit { 0.5025, 0.005,  0.4925, 0.99   } end) -- Window Right
bind({ "ctrl", "cmd" }, "k", function() hs.window.focusedWindow():moveToUnit { 0.005,  0.005,  0.99,   0.4925 } end) -- Window Top
bind({ "ctrl", "cmd" }, "j", function() hs.window.focusedWindow():moveToUnit { 0.005,  0.5025, 0.99,   0.99   } end) -- Window Bottom
bind({ "ctrl", "cmd" }, "u", function() hs.window.focusedWindow():moveToUnit { 0.005,  0.005,  0.4925, 0.4925 } end) -- Window Top Left
bind({ "ctrl", "cmd" }, "i", function() hs.window.focusedWindow():moveToUnit { 0.5025, 0.005,  0.4925, 0.4925 } end) -- Window Top Right
bind({ "ctrl", "cmd" }, "n", function() hs.window.focusedWindow():moveToUnit { 0.005,  0.5025, 0.4925, 0.4925 } end) -- Window Bottom Left
bind({ "ctrl", "cmd" }, "m", function() hs.window.focusedWindow():moveToUnit { 0.5025, 0.5025, 0.4925, 0.4925 } end) -- Window Bottom Right
