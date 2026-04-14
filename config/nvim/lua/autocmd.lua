-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function() vim.highlight.on_yank() end,
})

-- Set highlight
vim.api.nvim_create_autocmd("ColorScheme", { callback = function() Color.set_hl() end })

-- highlight yank
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Lsp Info",
  callback = function()
    if vim.g.lsp_info == true then
      vim.lsp.codelens.enable(true)
      if vim.g.dianostic_virtualtext == 1 then
        vim.diagnostic.config({ virtual_lines = true, float = { border = "rounded" } })
      elseif vim.g.dianostic_virtualtext == 2 then
        vim.diagnostic.config({ virtual_lines = { current_line = true }, float = { border = "rounded" } })
      end
    else
      vim.diagnostic.config({ virtual_lines = false, float = { border = "rounded" } })
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
      if type(info.build) == "function" then
        info.build { name = name, path = path }
      elseif type(info.build) == "string" then
        vim.cmd(info.build)
      end
    end
  end,
})
