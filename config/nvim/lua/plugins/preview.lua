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

  -- Previewer for quick window
  {
    "kevinhwang91/nvim-bqf",
    event = "QuickFixCmdPre",
  },
}
