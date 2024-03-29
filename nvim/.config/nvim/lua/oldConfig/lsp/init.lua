-- local commenter = {
--   -- Linters prefer comment and line to have a space in between markers
--   marker_padding = true,
--   -- should comment out empty or whitespace only lines
--   comment_empty = true,
--   -- Should key mappings be created
--   create_mappings = true,
--   -- Normal mode mapping left hand side
-- --   line_mapping = "gcc",
--   -- Visual/Operator mapping left hand side
--   operator_mapping = "gc"
-- }

local fmts = {
  logging = false,
  filetype = {
    json = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
          stdin = true
        }
      end
    },
    javascriptreact = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
          stdin = true
        }
      end
    },
    typescriptreact = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
          stdin = true
        }
      end
    },
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
    html = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
          stdin = true
        }
      end
    },
    php = {
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
          exe = "clang-format-14",
          args = {},
          stdin = true
        }
      end
    },
    cpp = {
      -- C++ FMT
      function()
        return {
          exe = "clang-format-14",
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
          exe = "clang-format-14",
          args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
          stdin = true
        }
      end
    }
  }
}
-- require("nvim_comment").setup(commenter)
require("formatter").setup(fmts)

require("go").setup()

local lsp_installer = require("nvim-lsp-installer").setup{}


lspconfig = require "lspconfig"
util = require "lspconfig/util"

lspconfig.gopls.setup {
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

lspconfig.tsserver.setup{}
lspconfig.jdtls.setup{}
lspconfig.rust_analyzer.setup{
  settings = {
    ['rust-analyzer'] = {},
  },
}
