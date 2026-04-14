-- Options
-- This should run without installing any plugins
vim.g.have_nerd_font = true
vim.o.breakindent = true
vim.o.cursorline = true -- Highlight the section where the cursor is (line or number)
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
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end) -- Sync clipboard with OS

-- Plugins
-- vim.pack.add({})
vim.pack.add({
	-- "https://github.com/folke/tokyonight.nvim"
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nyoom-engineering/oxocarbon.nvim",
	"https://github.com/vague-theme/vague.nvim",
	"https://github.com/nvim-mini/mini.nvim",
})

vim.lsp.config('lua_ls', {
  root_dir = function(bufnr, on_dir)
    if vim.fs.ext(vim.fn.bufname(bufnr)) ~= 'txt' then
      on_dir(vim.fn.getcwd())
    end
  end
})
-- vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")

require('mini.ai').setup()
require('mini.basics').setup({
	options = {extra_ui = true, relative_number = true, win_borders = 'dot'},
	mapping = {windows = false, move_with_alt = true},
})
require('mini.comment').setup()
require('mini.move').setup()
require('mini.git').setup()
require('mini.icons').setup()
require('mini.notify').setup()
require('mini.operators').setup()
require('mini.surround').setup()
require('mini.statusline').setup()
require('mini.splitjoin').setup()
require('mini.pairs').setup()
-- require('mini.keymap').setup()
require('mini.tabline').setup()
require('mini.pick').setup({options = {use_cache = true}})
require('mini.fuzzy').setup()
require('mini.diff').setup()
require('mini.files').setup({windows = { max_number = math.huge, preview = false}})

vim.keymap.set('n', '<leader>sf', ':Pick files<CR>')
vim.keymap.set('n', '<leader>sg', ":Pick files tool='git'<CR>")
vim.keymap.set('n', '<leader><leader>', ':Pick buffers<CR>')
vim.keymap.set('n', '<leader>sr', ":Pick grep_live tool='rg'<CR>")
vim.keymap.set('n', '<leader>ft', ":lua MiniFiles.open()<CR>")

vim.cmd.colorscheme('vague')
