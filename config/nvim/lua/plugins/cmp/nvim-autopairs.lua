local M = {}

local opts = {
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
}

function M.config()
  require("nvim-autopairs").setup(opts)
  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
  if vim.g.autopairs == true then
    require("nvim-autopairs").enable()
  else
    require("nvim-autopairs").disable()
  end
end

return M
