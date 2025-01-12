return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufRead", "BufNewFile" },
  main = "colorizer",
  opts = {
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
  },
}
