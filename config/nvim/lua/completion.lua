vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup", "fuzzy", "preview" }
-- vim.o.completeitemalign = "abbr,kind,menu"
-- vim.bo.completefunc
-- vim.o.autocomplete = true

-- Enable built-in LSP completion
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Enable built-in LSP completion",
  callback = function(args)
    if vim.g.cmp_enable ~= false then
      vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
    end
  end,
})

-- Toggle auto completion
vim.api.nvim_create_user_command("CmpToggle", function()
  Cache.update { g = { cmp_enable = not vim.g.cmp_enable } }
  vim.notify("Auto completion is " .. (vim.g.cmp_enable and "enabled" or "disabled"))

  for _, v in ipairs(vim.lsp.get_clients { bufnr = 0 }) do
    local client_id = v.dynamic_capabilities.client_id
    vim.cmd("tabdo windo lua vim.lsp.completion.enable(" .. (vim.g.cmp_enable and "true" or "false") .. ", " .. client_id .. ", 0, { autotrigger = true })")
  end
end, { desc = "Toggle auto completion" })

--- Completion with <C-n>/<C-p>
---@param n 1|-1
---@param key string
function completion_snippet_or(n, key)
  if vim.snippet.active() then
    vim.snippet.jump(n)
    return
  end
  if vim.fn.pumvisible() == 1 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", false)
    return
  end
  if vim.g.cmp_enable ~= false then
    local clients = vim.lsp.get_clients { bufnr = 0 }
    if #clients > 0 then
      vim.lsp.completion.get()
      return
    end
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", false)
end

--- Completion with tab
---@param select_key string
---@param key string
function completion_tab(select_key, key)
  if vim.fn.pumvisible() == 1 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(select_key, true, true, true), "n", false)
    return
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", false)
end

Utils.setmap {
  {
    "i",
    "<Tab>",
    function()
      completion_tab("<C-n>", "<Tab>")
    end,
    { desc = "<Tab> or next item" },
  },
  {
    "i",
    "<S-Tab>",
    function()
      completion_tab("C-p", "<S-Tab>")
    end,
    { desc = "<Tab> or next item" },
  },
  {
    "is",
    "<C-n>",
    function()
      completion_snippet_or(1, "<C-n>")
    end,
    { desc = "Snippet jump forward or LSP completion or next item" },
  },
  {
    "is",
    "<C-p>",
    function()
      completion_snippet_or(-1, "<C-p>")
    end,
    { desc = "Snippet jump back or LSP completion or prev item" },
  },
  {
    "i",
    "<CR>",
    function()
      if vim.fn.pumvisible() == 1 then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-y>", true, true, true), "n", false)
        return
      end
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", false)
    end,
    { desc = "<Tab> or next item" },
  },
}
