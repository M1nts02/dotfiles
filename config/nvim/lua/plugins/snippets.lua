return {
  "chrisgrieser/nvim-scissors",
  event = "VeryLazy",
  config = function()
    require("scissors").setup {
      snippetDir = ConfPath .. "/snippets",
      jsonFormatter = Utils.executable "jq" and "jq" or "none",
      backdrop = { enabled = true, blend = 100 },
    }
  end,
}
