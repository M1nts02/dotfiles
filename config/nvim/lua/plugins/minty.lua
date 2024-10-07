return {
  "nvchad/minty",
  keys = {
    {
      "<Space>ph",
      function()
        require("minty.huefy").open { border = true }
      end,
      desc = "Huefy",
    },
    {
      "<Space>ps",
      function()
        require("minty.shades").open { border = true }
      end,
      desc = "Shades",
    },
  },
  dependencies = {
    "nvchad/volt",
  },
}
