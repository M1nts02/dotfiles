return {
  {
    "olimorris/persisted.nvim",
    cmd = {
      "SessionToggle",
      "SessionStart",
      "SessionStop",
      "SessionSave",
      "SessionSelect",
      "SessionLoad",
      "SessionLoadLast",
      "SessionLoadFromFile",
      "SessionDelete",
    },
    config = function()
      require("persisted").setup()
      require("telescope").load_extension "persisted"
    end,
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
}
