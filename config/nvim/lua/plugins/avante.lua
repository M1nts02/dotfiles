return {
  "yetone/avante.nvim",
  build = function(plugin)
    if isWindows then
      vim.cmd(
        "!(cd  " .. plugin.path .. " && powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false)"
      )
    else
      vim.cmd("!(cd " .. plugin.path .. " && make)")
    end
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "ibhagwan/fzf-lua",
    "nvim-mini/mini.nvim",
    {
      "HakonHarnes/img-clip.nvim",
      config = function()
        require("img-clip").setup {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = { insert_mode = true },
            use_absolute_path = true,
          },
        }
      end,
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      config = function()
        require("render-markdown").setup { file_types = { "Avante" } }
      end,
    },
  },
  config = function()
    require("avante").setup {
      provider = "kimi-cli",
      acp_providers = {
        ["kimi-cli"] = {
          command = "kimi",
          args = { "acp" },
        },
      },
      selection = {
        enabled = false,
      },
    }
  end,
}
