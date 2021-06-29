" Plugins
call plug#begin('~/.vim/plugged')
" Plugins
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'prettier/vim-prettier', {'do': 'yarn install', 'branch': 'release/0.x' }
Plug 'machakann/vim-highlightedyank'
Plug 'iamcco/markdown-preview.nvim'
Plug 'tpope/vim-commentary'
Plug 'rstacruz/vim-closer'
Plug 'hoob3rt/lualine.nvim'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'fannheyward/telescope-coc.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

"Native LSP
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'


" Colors
Plug 'ap/vim-css-color'
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim'

" Javascript stuff
Plug 'mxw/vim-jsx'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'evanleck/vim-svelte', {'branch': 'main'}

call plug#end()
