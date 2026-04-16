local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.setup {}
require("luasnip.loaders.from_vscode").lazy_load()

ls.add_snippets("lua", {
  s("print_table", {
    t { "function print_lua_table(lua_table, indent)", "" },
    t { "  indent = indent or 0", "" },
    t { "  for k, v in pairs(lua_table) do", "" },
    t { '    if type(k) == "string" then', "" },
    t { '      k = string.format("%q", k)', "" },
    t { "    end", "" },
    t { '    local szSuffix = ""', "" },
    t { '    if type(v) == "table" then', "" },
    t { '      szSuffix = "{"', "" },
    t { "    end", "" },
    t { '    local szPrefix = string.rep(" ", indent)', "" },
    t { '    formatting = szPrefix .. "[" .. k .. "]" .. " = " .. szSuffix', "" },
    t { '    if type(v) == "table" then', "" },
    t { "      print(formatting)", "" },
    t { "      print_lua_table(v, indent + 1)", "" },
    t { '      print(szPrefix .. "},")', "" },
    t { "    else", "" },
    t { '      local szValue = ""', "" },
    t { '      if type(v) == "string" then', "" },
    t { '        szValue = string.format("%q", v)', "" },
    t { "      else", "" },
    t { "        szValue = tostring(v)", "" },
    t { "      end", "" },
    t { '      print(formatting .. szValue .. ",")', "" },
    t { "    end", "" },
    t { "  end", "" },
    t { "end", "" },
  }),
})

-- Select snippet by vim.ui.select
function ListSnippets()
  local snippets = {}
  for _, snippet in ipairs(ls.get_snippets(vim.bo.filetype)) do
    table.insert(snippets, {
      name = snippet.name or snippet.trigger,
      trigger = snippet.trigger,
      description = snippet.description and table.concat(snippet.description, " ") or "",
      snippet = snippet,
    })
  end

  if #snippets == 0 then
    vim.notify("No snippet", vim.log.levels.INFO)
    return
  end

  vim.ui.select(snippets, {
    prompt = "Select snippet:",
    format_item = function(item)
      return string.format("%s (%s) - %s", item.name, item.trigger, item.description)
    end,
  }, function(choice)
    if choice then
      ls.snip_expand(choice.snippet)
    end
  end)
end

Utils.setmap { { "i", "<C-l>", ListSnippets, { desc = "Snippets" } } }
Utils.setmap { { "n", "<Leader>fs", ListSnippets, { desc = "Snippets" } } }
