-- Options
-- This should run without installing any plugins
vim.g.have_nerd_font = true
vim.o.breakindent = true
vim.o.cursorline = true        -- Highlight the section where the cursor is (line or number)
vim.o.cursorlineopt = 'number' -- Force highlight only the number
vim.o.ignorecase = true
vim.o.inccommand = 'split'
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.showmode = false -- Don't show the modes, such as NORMAL or INSERT
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.timeoutlen = 200 -- how long it waits for key sequence to be completed
vim.o.undofile = true
vim.o.updatetime = 500 -- how long it waits to write to swap file
vim.opt.autocomplete = true
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.termguicolors = true
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end) -- Sync clipboard with OS


-- formatting
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.textwidth = 80

-- Plugins
-- vim.pack.add({})
vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nyoom-engineering/oxocarbon.nvim",
  "https://github.com/vague-theme/vague.nvim",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/deparr/tairiki.nvim"
})

vim.lsp.enable({
  "gopls",
  "lua_ls",
  "ts_ls",
  "rust-analyzer",
  "zls",
})

vim.treesitter.language.add('go')
vim.treesitter.language.add('typescript')
vim.treesitter.language.add('lua')
vim.treesitter.language.add('javascript')
vim.treesitter.language.add('rust')
vim.treesitter.language.add('zig')

vim.diagnostic.config({ virtual_text = true })

require("blink.cmp").setup({
  completion = {
    documentation = {
      auto_show = true,
    },
  },
  -- default blink keymaps
  keymap = {
    ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
    ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

    ['<C-y>'] = { 'select_and_accept', 'fallback' },
    ['<C-e>'] = { 'cancel', 'fallback' },
    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },

    ['<Tab>'] = { 'snippet_forward', 'fallback' },
    ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

    ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

    ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
  },

  fuzzy = {
    implementation = "lua",
  },
})

-- vim.lsp.log.set_level('debug')

require('mini.ai').setup()
require('mini.basics').setup({
  options = { extra_ui = true, relative_number = true, win_borders = 'dot' },
  mapping = { windows = false, move_with_alt = true },
})
require('mini.comment').setup()
require('mini.move').setup()
require('mini.git').setup()
require('mini.icons').setup()
require('mini.notify').setup()
-- require('mini.operators').setup()
require('mini.surround').setup()
require('mini.statusline').setup()
require('mini.splitjoin').setup()
require('mini.pairs').setup()
-- require('mini.keymap').setup()
-- require('mini.tabline').setup()
require('mini.pick').setup({ options = { use_cache = true } })
require('mini.fuzzy').setup()
require('mini.diff').setup()
require('mini.files').setup({ windows = { max_number = math.huge, preview = false } })
require('mini.base16').setup({
  palette = {
    base00 = '#112641',
    base01 = '#3a475e',
    base02 = '#606b81',
    base03 = '#8691a7',
    base04 = '#d5dc81',
    base05 = '#e2e98f',
    base06 = '#eff69c',
    base07 = '#fcffaa',
    base08 = '#ffcfa0',
    base09 = '#cc7e46',
    base0A = '#46a436',
    base0B = '#9ff895',
    base0C = '#ca6ecf',
    base0D = '#42f7ff',
    base0E = '#ffc4ff',
    base0F = '#00a5c5',
  },
  use_cterm = true,
  plugins = {
    default = false,
    ['nvim-mini/mini.nvim'] = true,
  },
})
-- require('mini.base16').setup({
--   palette = nil,
--   use_cterm = true,
--   plugins = {default = false, ['nvim-mini/mini.nvim'] = true,}
-- })


vim.keymap.set('n', '<leader>sf', ':Pick files<CR>')
vim.keymap.set('n', '<leader>sg', ":Pick files tool='git'<CR>")
vim.keymap.set('n', '<leader><leader>', ':Pick buffers<CR>')
vim.keymap.set('n', '<leader>sr', ":Pick grep_live tool='rg'<CR>")
vim.keymap.set('n', '<leader>ft', MiniFiles.open)

vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true,   -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
      vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation)
      vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action)
      vim.keymap.set('n', '<leader>r', vim.lsp.buf.references)
      vim.keymap.set('n', '<leader>d', vim.lsp.buf.references)
      vim.keymap.set('n', 'cd', vim.lsp.buf.rename)
    end

    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      -- client.server_capabilities.completionProvider.triggerCharacters = chars

      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
    -- if client and client:supports_method('textDocument/inlayHint', event.buf) then
    --   map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end, '[T]oggle Inlay [H]ints')
    -- end
    vim.lsp.inlay_hint.enable()
    vim.lsp.inlay_hint.is_enabled { bufnr = ev.buf }
  end,

})

vim.cmd.colorscheme('vague')

require('nvim-treesitter').setup {}
require('nvim-treesitter').install { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
  callback = function()
    -- syntax highlighting, provided by Neovim
    vim.treesitter.start()
    -- folds, provided by Neovim
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo.foldmethod = 'expr'
    -- indentation, provided by nvim-treesitter
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
