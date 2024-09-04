return {
  "stevearc/overseer.nvim",
  version = "*",
  cmd = {
    "OverseerRun",
    "OverseerInfo",
    "OverseerOpen",
    "OverseerBuild",
    "OverseerClose",
    "OverseerRunCmd",
    "OverseerToggle",
    "OverseerClearCache",
    "OverseerLoadBundle",
    "OverseerSaveBundle",
    "OverseerTaskAction",
    "OverseerQuickAction",
    "OverseerDeleteBundle",
  },
  opts = {},
  dependencies = {
    "mfussenegger/nvim-dap",
  },
}
