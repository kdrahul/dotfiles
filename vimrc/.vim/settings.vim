syntax on
filetype plugin indent on
set path+=**
set nowrap
set hidden
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set showmode
set showcmd
set nomodeline
set noswapfile
set ai
set nohlsearch
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
set complete-=i
set smarttab
set smartindent
set smartcase
set ignorecase
set autoread
set ruler
set wildmenu
set splitright
set splitbelow
set incsearch
set ttimeoutlen=10
set laststatus=0
"set colorcolumn=80
" set nu
" set rnu

set bg="dark"

colorscheme jellybeans
highlight Comment ctermfg=grey
highlight Comment cterm=italic

" Ignore stuff
set wildignore+=*/target/*,*/tmp/*,*.swp,*.pyc,*__pycache__/* 
