local builtin = require "statuscol.builtin"

require("statuscol").setup {
  relculright = true,
  ft_ignore = nil,
  bt_ignore = nil,
  segments = {
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    { text = { "%C" }, click = "v:lua.ScFa" },
    { text = { "%s" }, click = "v:lua.ScSa" },
    {
      text = { builtin.lnumfunc, " " },
      condition = { true, builtin.not_empty },
      click = "v:lua.ScLa",
    },
  },
  clickmod = "c",
}
