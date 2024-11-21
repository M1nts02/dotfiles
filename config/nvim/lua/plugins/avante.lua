return {
  "yetone/avante.nvim",
  cmd = {
    "AvanteToggle",
    "AvanteAsk",
    "AvanteChat",
    "AvanteEdit",
    "AvanteClear",
    "AvanteFocus",
    "AvanteRefresh",
    "AvanteSwitchProvider",
  },
  build = vim.g.is_windows and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" or "make",
  version = "*",
  opts = {
    provider = vim.g.ai_provider,
    auto_suggestions_provider = vim.g.ai_provider,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "Avante" },
      },
      ft = { "Avante" },
    },
  },
}
