local lsp_servers = {
  ["autotools_ls"] = "autotools-language-server",
  ["bashls"] = "bash-language-server",
  ["biome"] = "",
  ["clangd"] = vim.g.is_mac and "/usr/bin/clangd" or "",
  ["cmake"] = "cmake-language-server",
  ["csharp_ls"] = "csharp-ls",
  ["gdscript"] = vim.g.is_mac and "/Applications/Godot.app/Contents/MacOS/Godot" or "",
  ["gopls"] = "",
  ["jedi_language_server"] = "jedi-language-server",
  ["jdtls"] = "",
  ["lua_ls"] = "lua-language-server",
  ["marksman"] = "",
  ["neocmake"] = "neocmakelsp",
  ["nushell"] = "nu",
  ["pylsp"] = "",
  ["rust_analyzer"] = "rust-analyzer",
  ["sqls"] = "",
  ["zls"] = "",
}

return lsp_servers
