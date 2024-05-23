return {
  {
    provider = "%s",
    on_click = {
      callback = function()
        local mousepos = vim.fn.getmousepos()
        local line = mousepos.line
        vim.cmd("call win_gotoid(" .. mousepos.winid .. ")")
        vim.api.nvim_win_set_cursor(0, { line, mousepos.column })

        local get = require("dap.breakpoints").get
        local buf_id = vim.api.nvim_get_current_buf()
        local breakpoints = get()[buf_id]

        if breakpoints ~= nil then
          for _, breakpoint in ipairs(breakpoints) do
            if breakpoint.line == line then
              vim.cmd "DapToggleBreakpoint"
              return
            end
          end
        end

        if vim.fn.foldclosed(line) ~= -1 then
          pcall(vim.cmd, "foldopen")
        else
          pcall(vim.cmd, "foldclose")
        end
      end,
      name = "heirline_fold",
      update = true,
    },
  },
  {
    provider = "%=%4{v:virtnum ? '' : &nu ? (&rnu && v:relnum ? v:relnum : v:lnum) . ' ' : ''}",
    on_click = {
      callback = function()
        local mousepos = vim.fn.getmousepos()
        vim.cmd("call win_gotoid(" .. mousepos.winid .. ")")
        vim.api.nvim_win_set_cursor(0, { mousepos.line, mousepos.column })
        local sign_at_cursor = vim.fn.screenstring(mousepos.screenrow, mousepos.screencol)
        if sign_at_cursor ~= "" then
          vim.cmd "DapToggleBreakpoint"
        end
      end,
      name = "heirline_num",
      update = true,
    },
  },
  {
    provider = "%{% &fdc ? '%C ' : '' %}",
  },
}
