_G.dap_toggle_breakpoint = function() vim.cmd('DapToggleBreakpoint') end
vim.o.statuscolumn = "%@v:lua.dap_toggle_breakpoint@%s%T%l "
