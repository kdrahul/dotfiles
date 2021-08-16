DATA_PATH = vim.fn.stdpath "data"
CACHE_PATH = vim.fn.stdpath "cache"
TERMINAL = vim.fn.expand "$TERM"

O = {
  auto_close_tree = 0,
  auto_complete = true,
  colorscheme = "omni",
  hidden_files = true,
  wrap_lines = false,
  number = true,
  relative_number = true,
  cursorline = false,
  shell = "dash",
  timeoutlen = 100,
  background = "dark",
  nvim_tree_disable_netrw = 0,
  statusline = 0,
  ignore_case = true,
  smart_case = true,
  hl_search = false,
  transparent_window = false,
  leader_key = "space",
  -- @usage pass a table with your desired languages
  treesitter = {
    ensure_installed = "all",
    ignore_install = {"haskell"},
    highlight = {enabled = true},
    rainbow = {enabled = false}
  },
  plugin = {
    hop = {active = false},
    dial = {active = false},
    dashboard = {active = false},
    matchup = {active = false},
    colorizer = {active = false},
    numb = {active = false},
    zen = {active = false},
    ts_playground = {active = false},
    indent_line = {active = false},
    ts_context_commentstring = {active = false},
    symbol_outline = {active = false},
    debug = {active = false},
    bqf = {active = false},
    trouble = {active = false},
    floatterm = {active = false},
    spectre = {active = false},
    lsp_rooter = {active = false},
    markdown_preview = {active = false},
    codi = {active = false},
    telescope_fzy = {active = false},
    sanegx = {active = false},
    snap = {active = false},
    ranger = {active = false},
    todo_comments = {active = false},
    lsp_colors = {active = false},
    git_blame = {active = false},
    gist = {active = false},
    gitlinker = {active = false},
    lazygit = {active = false},
    octo = {active = false},
    lush = {active = false},
    diffview = {active = false},
    bracey = {active = false},
    telescope_project = {active = false},
    dap_install = {active = false},
    tabnine = {active = false}
  },
  lang = {
    python = {
      linter = "",
      -- @usage can be 'yapf', 'black'
      formatter = "autopep8",
      autoformat = false,
      isort = false,
      diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      },
      analysis = {
        type_checking = "basic",
        auto_search_paths = true,
        use_library_code_types = true
      }
    },
    lua = {
      -- @usage can be 'lua-format'
      formatter = "",
      autoformat = false,
      diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      }
    },
    sh = {
      -- @usage can be 'shellcheck'
      linter = "",
      -- @usage can be 'shfmt'
      formatter = "",
      autoformat = false,
      diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      }
    },
    tsserver = {
      -- @usage can be 'eslint'
      linter = "eslint",
      -- @usage can be 'prettier'
      formatter = "prettier",
      autoformat = false,
      diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      }
    },
    json = {
      -- @usage can be 'prettier'
      formatter = "prettier",
      autoformat = true,
      diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      }
    },
    tailwindcss = {
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact"
      }
    },
    clang = {
      diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      },
      cross_file_rename = true,
      header_insertion = "never",
      autoformat = false -- update this to true for enabling autoformat
    },
    ruby = {
      diagnostics = {
        virtualtext = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      },
      filetypes = {"rb", "erb", "rakefile", "ruby"}
    },
    go = {},
    cpp = {
      diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      },
      cross_file_rename = true,
      header_insertion = "never",
      autoformat = false -- update this to true for enabling autoformat
    },
    elixir = {},
    vim = {},
    yaml = {},
    terraform = {},
    rust = {
      linter = "",
      formatter = "rustfmt",
      autoformat = true,
      diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      }
    },
    svelte = {},
    php = {
      format = {
        braces = "psr12"
      },
      environment = {
        php_version = "7.4"
      },
      autoformat = false,
      diagnostics = {
        virtual_text = {spacing = 0, prefix = ""},
        signs = true,
        underline = true
      },
      filetypes = {"php", "phtml"}
    },
    latex = {},
    kotlin = {},
    html = {},
    elm = {},
    markdown = {
        formatter = "prettier"
    },
    emmet = {active = true},
    graphql = {},
    efm = {},
    docker = {},
    cmake = {},
    java = {},
    css = {
      formatter = "",
      autoformat = false,
      virtual_text = true
    }
  }
}
