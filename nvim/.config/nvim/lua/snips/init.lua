local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

-- Contains snippets
ls.snippets = {
    -- Applicable to all file types
    all = {
    },

    -- Applicable to only Rust files
    rust = {
    },

    -- Applicable to only Python files
    python = {
    },
}
