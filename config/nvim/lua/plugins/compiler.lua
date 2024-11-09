return {
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {},
    dependencies = {
      "nvim-telescope/telescope.nvim",
      {
        "stevearc/overseer.nvim",
        opts = {
          task_list = {
            direction = "bottom",
            min_height = 25,
            max_height = 25,
            default_detail = 1,
          },
        },
      },
    },
  },
}
