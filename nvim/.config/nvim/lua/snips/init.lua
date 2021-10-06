local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local function copy(args)
  return args[1]
end

-- Contains snippets
ls.snippets = {
  -- Applicable to all file types
  all = {},
  -- Applicable to only Rust files
  rust = {},
  -- Applicable to only Python files
  python = {},
  -- Applicable to only Javascript files
  javascript = {
    s(
      "comp",
      {
        t("// Component"),
        -- Function name placeholder
        -- f(copy, "name"),
        t({"", "const "}),
        i(2, "name"),
        t(" = ("),
        -- Function parameter placeholder
        i(1, "params"),
        t({") => {", "\t"}),
        i(0),
        t({"", "}"})
      }
    )
  }
}

