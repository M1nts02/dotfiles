local utils = require "modules.utils"
local executable = utils.executable
local lspconfig = require "lspconfig"
local opts = require "plugins.lsp.options"
local on_attach = opts.on_attach
local capabilities = opts.capabilities

lspconfig.clangd.setup {
  cmd = { "/usr/bin/clangd" },
  on_attach = on_attach,
  capabilities = capabilities,
}

local godot_mono = "/Applications/Godot_mono.app/Contents/MacOS/Godot"
local godot = "/Applications/Godot.app/Contents/MacOS/Godot"
if executable(godot_mono) then
  lspconfig.gdscript.setup {
    cmd = { godot_mono },
    on_attach = on_attach,
    capabilities = capabilities,
  }
elseif executable(godot) then
  lspconfig.gdscript.setup {
    cmd = { godot },
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
