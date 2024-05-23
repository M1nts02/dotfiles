local pad_string = function(str, padding)
  return str and str ~= "" and string.rep(" ", padding.left or 0) .. str .. string.rep(" ", padding.right or 0) or ""
end

return {
  {
    init = function(self)
      local filename = vim.api.nvim_buf_get_name(0)
      local extension = vim.fn.fnamemodify(filename, ":e")
      self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
    end,
    provider = function(self)
      return self.icon and (" " .. self.icon .. " ")
    end,
    hl = function()
      return { fg = "blue" }
    end,
  },
  {
    provider = function()
      local stbufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
      local path = vim.api.nvim_buf_get_name(stbufnr)
      local filename = (path == "" and "Empty ") or path:match "([^/\\]+)[/\\]*$"

      return filename
    end,
    hl = function()
      return { fg = "fg" }
    end,
  },
  {
    init = function(self)
      local opts = {
        max_depth = 5,
        separator = " ",
        icon = { enabled = true, hl = { fg = "fg" } },
        padding = { left = 0, right = 0 },
      }

      local data = require("aerial").get_location(true) or {}
      local children = {}
      local start_idx = 0

      for i, d in ipairs(data) do
        if i > start_idx then
          local child = {
            {
              provider = string.gsub(d.name, "%%", "%%%%"):gsub("%s*->%s*", ""),
            },
            on_click = {
              minwid = bit.bor(bit.lshift(d.lnum, 16), bit.lshift(d.col, 6), self.winnr),
              bit.bor(bit.lshift(d.lnum, 16), bit.lshift(d.col, 6), self.winnr),
              callback = function(_, minwid)
                local lnum, col, winnr =
                  bit.rshift(minwid, 16), bit.band(bit.rshift(minwid, 6), 1023), bit.band(minwid, 63)
                vim.api.nvim_win_set_cursor(vim.fn.win_getid(winnr), { lnum, col })
              end,
              name = "heirline_breadcrumbs",
            },
          }

          table.insert(child, 1, {
            provider = opts.separator,
            hl = { fg = "fg1" },
          })

          -- Icon
          local hl = opts.icon.hl
          if type(hl) == "function" then
            hl = hl(self)
          end

          local hlgroup = string.format("Aerial%sIcon", d.kind)
          table.insert(child, 2, {
            provider = string.format("%s ", d.icon),
            hl = (hl and vim.fn.hlexists(hlgroup) == 1) and hlgroup or nil,
          })

          table.insert(children, child)
        end
      end

      -- add left padding.
      if opts.padding.left > 0 then
        table.insert(children, 1, {
          provider = pad_string(" ", { left = opts.padding.left - 1 }),
        })
      end

      -- add right padding.
      if opts.padding.right > 0 then
        table.insert(children, {
          provider = pad_string(" ", { right = opts.padding.right - 1 }),
        })
      end

      self[1] = self:new(children, 1)
    end,

    hl = { fg = "fg" },
    padding = { left = 1, right = 1 },
    condition = function()
      return package.loaded["aerial"]
    end,
    update = "CursorMoved",
  },

  { provider = "%=", hl = { fg = "fg" } },
}
