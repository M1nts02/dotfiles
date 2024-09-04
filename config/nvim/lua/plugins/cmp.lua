local cache = require "modules.cache"
local get_status = cache.get_status

local function get_cmp_status()
  if vim.g.cmp_disable == false and vim.b.cmp_disable == false then
    return true
  else
    return false
  end
end

local function config()
  local cmp = require "cmp"
  cmp.setup {
    enabled = function()
      local buftype = vim.api.nvim_get_option_value("buftype", { buf = 0 })
      if buftype == "prompt" then
        return false
      end
      return get_cmp_status()
    end,
    completion = {
      keyword_length = 3,
    },
    window = {
      completion = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,Search:None",
        scrollbar = false,
        border = "rounded",
      },
      documentation = {
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,Search:None",
        border = "rounded",
        scrollbar = false,
      },
    },
    mapping = {
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<Esc>"] = cmp.mapping.close(),
      ["<C-c>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<S-CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ["<Up>"] = cmp.mapping.select_prev_item(),
      ["<Down>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<Tab>"] = cmp.mapping.select_next_item(),
      ["<C-n>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif vim.snippet.active { direction = 1 } then
          vim.snippet.jump(1)
        elseif get_cmp_status() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<C-p>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.snippet.active { direction = -1 } then
          vim.snippet.jump(-1)
        elseif get_cmp_status() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "snippets", max_item_count = 10 },
      { name = "path" },
      { name = "buffer" },
      { name = "nvim_lsp_signature_help" },
      { name = "fittencode", group_index = 1 },
    },
  }
end

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = config,
  dependencies = {
    "hrsh7th/cmp-path", -- Support path
    "hrsh7th/cmp-nvim-lsp", -- Support LSP
    "hrsh7th/cmp-buffer", -- Buffer
    "hrsh7th/cmp-nvim-lsp-signature-help",
    { -- FittenCode
      "luozhiya/fittencode.nvim",
      cmd = "Fitten",
      opts = { completion_mode = "source" },
      config = function(_, opts)
        require("fittencode").setup(opts)
        if get_status().g.fittencode then
          vim.cmd "Fitten enable_completions"
        else
          vim.cmd "Fitten disable_completions"
        end
      end,
    },
  },
}
