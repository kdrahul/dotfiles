local commenter = {
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- Should key mappings be created
  create_mappings = true,
  -- Normal mode mapping left hand side
  line_mapping = "gcc",
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc"
}

local fmts = {
  logging = false,
  filetype = {
    typescript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
          stdin = true
        }
      end
    },
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
          stdin = true
        }
      end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
    lua = {
      -- luafmt
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    },
    python = {
      -- luafmt
      function()
        return {
          exe = "autopep8",
          args = {"-"},
          stdin = true
        }
      end
    },
    c = {
      -- C FMT
      function()
        return {
          exe = "clang-format",
          args = {},
          stdin = true
        }
      end
    },
    cpp = {
      -- C++ FMT
      function()
        return {
          exe = "clang-format",
          args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
          stdin = true,
          cwd = vim.fn.expand("%:p:h")
        }
      end
    },
    java = {
      -- C++ FMT
      function()
        return {
          exe = "clang-format",
          args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    }
  }
}

require("lspconfig").tsserver.setup({})
require("lspconfig").ccls.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").sumneko_lua.setup({})
require("lspconfig").pyright.setup({})
require("nvim_comment").setup(commenter)

require("formatter").setup(fmts)
