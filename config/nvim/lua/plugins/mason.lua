return {
  "mason-org/mason.nvim",
  init = function()
    -- Add env for mason
    vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (isWindows and ";" or ":") .. vim.env.PATH
  end,
  cmd = { "Mason", "MasonInstall", "MasonLog", "MasonUninstall", "MasonUninstallAll", "MasonUpdate" },
  config = function()
    require("mason").setup {
      PATH = "skip",
      max_concurrent_installers = 10,
      ui = {
        border = "rounded",
        backdrop = 100,
        keymaps = {
          toggle_package_expand = "<CR>",
          install_package = "i",
          update_package = "u",
          check_package_version = "c",
          update_all_packages = "U",
          check_outdated_packages = "C",
          uninstall_package = "X",
          cancel_installation = "<C-c>",
          apply_language_filter = "<C-f>",
        },
      },
    }
  end,
}
