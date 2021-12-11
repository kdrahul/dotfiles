local cmp = require "cmp"
local lspkind = require "lspkind"

cmp.setup(
  {
      -- formatting = {
      --   format = lspkind.cmp_format({with_text = true,
      --   preset = 'default',
      --   -- Override default symbol map
      --   
      --   symbol_map = {},
      --   menu = {
      --       buffer = "[BUF]",
      --       nvim_lsp = "[LSP]",
      --       path = "[PATH]",
      --       luasnip = "[SNIP]",
      --   }, })
      -- },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end
    },
    mapping = {
      ["<C-n>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert}),
      ["<C-p>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert}),
      ["<Down>"] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
      ["<Up>"] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<C-y>"] = cmp.mapping.confirm(
        {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true
        }
      )
    },
    sources = cmp.config.sources {
      {name = "nvim_lsp"},
      {name = "luasnip"},
      {name = "buffer"},
      {name = "path"}
    }
  }
)

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
require("lspconfig")["tsserver"].setup {
  capabilities = capabilities
}
require("lspconfig")["rust_analyzer"].setup {
  capabilities = capabilities
}
require("lspconfig")["ccls"].setup {
  capabilities = capabilities
}
require("lspconfig")["pyright"].setup {
  capabilities = capabilities
}
