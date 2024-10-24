return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufRead", "BufNewFile" },
  keys = {
    {
      "<Space>pc",
      function()
        vim.cmd "ColorizerToggle"
      end,
      desc = "Colorizer",
    },
  },
  conig = function()
    require("colorizer").setup {
      ["*"] = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        rgb_fn = false,
        hsl_fn = false,
        css = false,
        css_fn = false,
        mode = "background",
      },
    }
  end,
}
