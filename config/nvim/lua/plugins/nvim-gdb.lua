-- change layout
vim.api.nvim_create_autocmd({ "VimResized", "VimEnter" }, {
  callback = function()
    local height = vim.opt.lines:get() * 2
    local width = vim.opt.columns:get()
    if height > width then
      vim.g.nvimgdb_config = {
        sign_current_line = "▶",
        sign_breakpoint_priority = 10,
        termwin_command = "belowright new",
        codewin_command = "new",
        set_scroll_off = 5,
        jump_bottom_gdb_buf = true,
      }
    else
      vim.g.nvimgdb_config = {
        sign_current_line = "▶",
        sign_breakpoint = { "●" },
        sign_breakpoint_priority = 10,
        termwin_command = "belowright vnew",
        codewin_command = "vnew",
        set_scroll_off = 5,
        jump_bottom_gdb_buf = true,
      }
    end
  end,
})

return {
  "sakhnik/nvim-gdb",
  cmd = {
    "GdbStart",
    "GdbStartLLDB",
    "GdbStartPDB",
    "GdbStartBashDB",
    "GdbStartRR",
    "GdbBreakpointToggle",
    "GdbUntil",
    "GdbContinue",
    "GdbNext",
    "GdbStep",
    "GdbFinish",
    "GdbFrameUp",
    "GdbFrameDown",
  },
}
