local M = {}

local path_package = vim.fn.stdpath "data" .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd 'echo "Installing `mini.nvim`" | redraw'
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.nvim",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd "packadd mini.nvim | helptags ALL"
  vim.cmd 'echo "Installed `mini.nvim`" | redraw'
end

local MiniDeps = require "mini.deps"

MiniDeps.setup { path = { package = path_package } }

M.add, M.now, M.later = MiniDeps.add, MiniDeps.now, MiniDeps.later

function M.pack(plug, opt)
  opt = opt or {}
  local now, later, enabled, build = opt.now, opt.later, opt.enabled, opt.build
  -- if enabled
  if enabled == false then
    return
  end

  if build then
    local function plugin_build(params)
      vim.system(build, { cwd = params.path }):wait()
    end

    plug.hooks = plug.hooks or {}
    plug.hooks.post_checkout = plug.hooks.post_checkout or plugin_build
    plug.hooks.post_install = plug.hooks.post_install or plugin_build
  end

  -- add plugin
  M.add(plug)
  -- set now
  if now then
    M.now(now)
  end
  -- set later
  if later then
    M.later(later)
  end
end

return M
