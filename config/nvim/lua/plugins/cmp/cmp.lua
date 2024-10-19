local M = {}

local function get_cmp_status()
  if vim.g.cmp_disable == false and vim.b.cmp_disable == false then
    return true
  else
    return false
  end
end

function M.config()
  local cmp = require "cmp"
  local luasnip = require "luasnip"
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
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
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
        -- elseif vim.snippet.active { direction = 1 } then
        --   vim.snippet.jump(1)
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
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
        -- elseif vim.snippet.active { direction = -1 } then
        --   vim.snippet.jump(-1)
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
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
      { name = "luasnip" },
      { name = "path" },
      { name = "buffer" },
      { name = "nvim_lsp_signature_help" },
      { name = "fittencode", group_index = 1 },
      { name = "calc" },
    },
  }
end

return M
