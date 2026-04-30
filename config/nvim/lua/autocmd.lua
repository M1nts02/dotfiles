-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- AutoInsertMode
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd "startinsert"
    end
  end,
})

-- Set highlight
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    Color.set_hl()
  end,
})

-- Lsp
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Lsp Info",
  callback = function()
    if vim.g.lsp_info == true then
      vim.lsp.codelens.enable(true)
      if vim.g.dianostic_virtualtext == 1 then
        vim.diagnostic.config { virtual_lines = true, float = { border = "rounded" } }
      elseif vim.g.dianostic_virtualtext == 2 then
        vim.diagnostic.config { virtual_lines = { current_line = true }, float = { border = "rounded" } }
      end
    else
      vim.diagnostic.config { virtual_lines = false, float = { border = "rounded" } }
    end
  end,
})

-- Build Plugins
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(args)
    local data = args.data or {}
    local kind = data.kind
    if kind ~= "install" and kind ~= "update" then
      return
    end
    local name = data.spec and data.spec.name
    if name and Pack.build_info[name] then
      local info = Pack.build_info[name]
      local pack_info = vim.pack.get({ name }, { info = false })[1]
      if not pack_info then
        return
      end
      local path = pack_info.path
      local build = info.build
      if type(build) == "function" then
        build { name = name, path = path }
      elseif type(build) == "string" then
        if string.sub(build, 1, 1) == ":" then
          vim.cmd(string.sub(build, 2))
        else
          vim.cmd("!(cd  " .. path .. " && " .. info.build .. ")")
        end
      end
    end
  end,
})

-- Large file
local large_file_size = 20 * 1024 * 1024
vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  callback = function(ev)
    local size = vim.fn.getfsize(ev.file)
    if size > large_file_size or size == -2 then
      vim.bo.swapfile = false
      vim.bo.bufhidden = "unload"
      vim.bo.undolevels = -1
      vim.bo.undofile = false
      vim.cmd "syntax off"
      vim.cmd "filetype off"
      vim.wo.relativenumber = false
      vim.wo.cursorline = false
      vim.wo.cursorcolumn = false
    end
  end,
})
