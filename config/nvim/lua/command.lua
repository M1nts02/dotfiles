-- Open cache file
vim.api.nvim_create_user_command("CustomOpen", "e " .. CachePath, { desc = "Open cache file" })

-- Toggle dark mode
vim.api.nvim_create_user_command("DarkMode", function()
  Color.dark_mode(not vim.g.dark)
end, { desc = "Toggle dark mode" })

-- Toggle Wrap
vim.api.nvim_create_user_command("WrapToggle", function()
  local s = not vim.opt.wrap:get()
  Cache.update { opt = { wrap = s } }
  local i = s == true and "true" or "false"
  vim.cmd("tabdo windo lua vim.opt.wrap = " .. i)
  vim.notify("Wrap is " .. (s and "enabled" or "disabled"))
end, { desc = "Toggle wrap" })

-- Zoxide
vim.api.nvim_create_user_command("Zoxide", function()
  local handle = io.popen "zoxide query -l 2>/dev/null"
  if not handle then
    vim.notify("Failed to run zoxide", vim.log.levels.ERROR)
    return
  end

  local result = handle:read "*a"
  handle:close()

  local items = {}
  for line in result:gmatch "[^\r\n]+" do
    if line ~= "" then
      table.insert(items, line)
    end
  end

  vim.ui.select(items, { prompt = "Zoxide" }, function(choice)
    if choice then
      vim.cmd("cd " .. vim.fn.fnameescape(choice))
      vim.notify("Changed directory to: " .. choice, vim.log.levels.INFO)
    end
  end)
end, { desc = "Zoxide" })

-- Toggle LSP info
vim.api.nvim_create_user_command("LspVirtualText", function()
  Cache.update { g = { lsp_info = not vim.g.lsp_info } }
  if vim.g.lsp_info == true then
    vim.lsp.codelens.enable(true)
    vim.cmd "tabdo windo lua vim.lsp.inlay_hint.enable(true, { bufnr = 0 })"
    if vim.g.dianostic_virtualtext == 1 then
      vim.diagnostic.config { virtual_lines = true, float = { border = "rounded" } }
    elseif vim.g.dianostic_virtualtext == 2 then
      vim.diagnostic.config { virtual_lines = { current_line = true }, float = { border = "rounded" } }
    end
  else
    vim.lsp.codelens.enable(false)
    vim.cmd "tabdo windo lua vim.lsp.inlay_hint.enable(false, { bufnr = 0 })"
    vim.diagnostic.config { virtual_lines = false, float = { border = "rounded" } }
  end
end, { desc = "LSP Info" })

-- Uninstall Plugins
vim.api.nvim_create_user_command("PackUninstall", function()
  local all_packs = vim.pack.get(nil, { info = false })
  local inactive = {}
  for _, pack in ipairs(all_packs) do
    if pack.active == false then
      table.insert(inactive, pack.spec.name)
    end
  end
  if #inactive == 0 then
    vim.notify("No inactive plugins to uninstall", vim.log.levels.INFO)
    return
  end
  vim.pack.del(inactive)
end, { desc = "Uninstall all inactive plugins" })

-- Update Plugins
vim.api.nvim_create_user_command("PackUpdate", function(opts)
  local fargs = opts.fargs
  if #fargs == 0 then
    vim.pack.update()
  else
    vim.pack.update(fargs)
  end
end, { desc = "Update plugins", nargs = "*", complete = Utils.plugins_complete })

-- Gitui
vim.api.nvim_create_user_command("Gitui", function()
  vim.cmd "tabnew"
  local buf = vim.api.nvim_get_current_buf()
  vim.fn.jobstart(vim.g.dark and "gitui -t catppuccin-mocha.ron" or "gitui -t catppuccin-latte.ron", {
    term = true,
    on_exit = function(_, code)
      if code ~= 0 then
        return
      end
      vim.schedule(function()
        pcall(vim.api.nvim_buf_delete, buf, { force = true })
      end)
    end,
  })
  vim.api.nvim_buf_set_name(buf, 'term://gitui')
  vim.cmd "startinsert"
end, {})

-- Yazi
vim.api.nvim_create_user_command("Yazi", function()
  -- get path
  local current = vim.api.nvim_buf_get_name(0)
  local start_path = current ~= "" and vim.fn.fnamemodify(current, ":p") or vim.fn.getcwd()

  -- temp file
  local tmpfile = vim.fn.tempname()
  local prev_tab = vim.api.nvim_get_current_tabpage()

  vim.cmd.tabnew()
  local yazi_tab = vim.api.nvim_get_current_tabpage()

  vim.fn.jobstart({ "yazi", "--chooser-file", tmpfile, start_path }, {
    term = true,
    on_exit = function(_, code)
      vim.schedule(function()
        -- closed tab
        if vim.api.nvim_tabpage_is_valid(yazi_tab) then
          if vim.api.nvim_get_current_tabpage() ~= yazi_tab then
            vim.api.nvim_set_current_tabpage(yazi_tab)
          end
          vim.cmd("silent! tabclose")
        end

        -- get return path
        local ok, chosen = pcall(vim.fn.readfile, tmpfile)
        pcall(vim.fn.delete, tmpfile)

        if ok and #chosen > 0 and chosen[1] ~= "" then
          if vim.api.nvim_tabpage_is_valid(prev_tab) then
            vim.api.nvim_set_current_tabpage(prev_tab)
          end
          vim.cmd("edit " .. vim.fn.fnameescape(chosen[1]))
        end
      end)
    end,
  })
  vim.cmd.startinsert()
end, {})

-- Terminal
vim.api.nvim_create_user_command("Term", function()
  local current_buf = vim.api.nvim_get_current_buf()
  if vim.bo[current_buf].buftype == "terminal" then
    vim.api.nvim_buf_delete(current_buf, { force = true })
    return
  end

  vim.cmd "tabnew"
  local buf = vim.api.nvim_get_current_buf()
  vim.fn.jobstart(vim.o.shell, {
    term = true,
    on_exit = function(_, code)
      if code ~= 0 then
        return
      end
      vim.schedule(function()
        pcall(vim.api.nvim_buf_delete, buf, { force = true })
      end)
    end,
  })
  vim.cmd "startinsert"
end, {})

-- Show Plugins Status
vim.api.nvim_create_user_command("PackStatus", function(opts)
  local fargs = opts.fargs
  if #fargs == 0 then
    vim.pack.update(nil, { offline = true })
  else
    vim.pack.update(fargs, { offline = true })
  end
end, { desc = "Show plugins Status", nargs = "*", complete = Utils.plugins_complete })
