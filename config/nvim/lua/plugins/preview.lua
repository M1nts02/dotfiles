return {
  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Color highlighting
  {
    "norcalli/nvim-colorizer.lua",
    cmd = {
      "ColorizerAttachToBuffer",
      "ColorizerDetachFromBuffer",
      "ColorizerReloadAllBuffers",
      "ColorizerToggle",
    },
    main = "colorizer",
    opts = {},
  },

  -- Previewer for quick window
  {
    "kevinhwang91/nvim-bqf",
    event = "QuickFixCmdPre",
  },
}
