return {
  "chrisgrieser/nvim-scissors",
  config = function()
    require("scissors").setup {
      snippetDir = ConfPath .. "/snippets",
      jsonFormatter = Utils.executable "jq" and "jq" or "none",
      backdrop = { enabled = true, blend = 100 },
    }
  end,
}
