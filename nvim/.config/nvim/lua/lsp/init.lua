local rust_opts = {
  tools = {
    -- rust-tools options
    -- automatically set inlay hints (type hints)
    -- There is an issue due to which the hints are not applied on the first
    -- opened file. For now, write to the file to trigger a reapplication of
    -- the hints or just run :RustSetInlayHints.
    -- default: true
    autoSetHints = true,
    -- whether to show hover actions inside the hover window
    -- this overrides the default hover handler
    -- default: true
    hover_with_actions = true,
    runnables = {
      -- whether to use telescope for selection menu or not
      -- default: true
      use_telescope = true

      -- rest of the opts are forwarded to telescope
    },
    inlay_hints = {
      -- wheter to show parameter hints with the inlay hints or not
      -- default: true
      show_parameter_hints = true,
      -- prefix for parameter hints
      -- default: "<-"
      parameter_hints_prefix = "<-",
      -- prefix for all the other hints (type, chaining)
      -- default: "=>"
      other_hints_prefix = "=>",
      -- whether to align to the lenght of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- whether to align to the extreme right or not
      right_align = false,
      -- padding from the right if right_align is true
      right_align_padding = 7
    },
    hover_actions = {
      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        {"╭", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╮", "FloatBorder"},
        {"│", "FloatBorder"},
        {"╯", "FloatBorder"},
        {"─", "FloatBorder"},
        {"╰", "FloatBorder"},
        {"│", "FloatBorder"}
      }
    }
  },
  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {} -- rust-analyer options
}

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
          args = {},
          stdin = true
        }
      end
    },
    java = {
      -- C++ FMT
      function()
        return {
          exe = "clang-format",
          args = {},
          stdin = true
        }
      end
    }
  }
}

require("lspconfig").tsserver.setup({})
require("lspconfig").ccls.setup({})
require("lspconfig").rust_analyzer.setup({})
require("rust-tools").setup(rust_opts)
require("lspconfig").sumneko_lua.setup({})
require("nvim_comment").setup(commenter)

require("formatter").setup(fmts)
