local M = { "yetone/avante.nvim" }

M.keys = {
  { "<Space>aa", "<CMD>AvanteToggle<CR>", desc = "Toggle" },
  { "<Space>ah", "<CMD>AvanteHistory<CR>", desc = "History" },
  { "<Space>an", "<CMD>AvanteChatNew<CR>", desc = "New Chat" },
}

M.build = isWindows and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" or "make"
M.event = "VeryLazy"
M.version = false

M.dependencies = {
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
  "ibhagwan/fzf-lua",
  "nvim-mini/mini.nvim",
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        embed_image_as_base64 = false,
        prompt_for_file_name = false,
        drag_and_drop = { insert_mode = true },
        use_absolute_path = true,
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = { file_types = { "Avante" } },
    ft = { "markdown", "Avante" },
  },
}

M.opts = {
  provider = "kimi-cli",
  acp_providers = {
    ["kimi-cli"] = {
      command = "kimi",
      args = { "acp" },
    },
  },
  behaviour = {
    auto_set_keymaps = false,
  },
}

return M
