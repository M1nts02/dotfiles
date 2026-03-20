--------------------------- Window ------------------------------
local bind = hs.hotkey.bind

bind({ "ctrl", "cmd" }, "o", Actions["Window Maximize"])
bind({ "ctrl", "cmd" }, "c", Actions["Window Center"])
bind({ "ctrl", "cmd" }, "y", Actions["Window Default"])
bind({ "ctrl", "cmd" }, "h", Actions["Window Left"])
bind({ "ctrl", "cmd" }, "l", Actions["Window Right"])
bind({ "ctrl", "cmd" }, "k", Actions["Window Top"])
bind({ "ctrl", "cmd" }, "j", Actions["Window Bottom"])
bind({ "ctrl", "cmd" }, "u", Actions["Window Top Left"])
bind({ "ctrl", "cmd" }, "i", Actions["Window Top Right"])
bind({ "ctrl", "cmd" }, "n", Actions["Window Bottom Left"])
bind({ "ctrl", "cmd" }, "m", Actions["Window Bottom Right"])
