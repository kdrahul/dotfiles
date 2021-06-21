" Shell
    set shell=/bin/dash

" Leader key remap
    let mapleader = "\<Space>"

source ~/.config/nvim/plugins.vim

" Markdown
  let g:mkdp_highlight_css = '/home/rdk/.config/nvim/markdown-tomorrow-night.css'
  let g:mkdp_refresh_slow = 1
  let g:mkdp_markdown_css = '/home/rdk/.config/nvim/markdown-tomorrow-night-theme.css'

" Coc bindings
  let g:lsc_auto_map = v:true
  let g:config_Beautifier = v:true
  inoremap <silent><expr> <c-space> coc#refresh()

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  nnoremap <silent> <leader>a :CocAction<CR>
  nnoremap <silent> <leader>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<CR>
  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

" Peek Definition from CoC
  nnoremap <silent> K :call <SID>show_documentation()<CR> 

" Copy to clipboard
  nnoremap <leader>y "+y

" Exit Vim with <C-J>
  nnoremap <C-J> <Esc>
  inoremap <C-J> <Esc>
  vnoremap <C-J> <Esc>
  tnoremap <leader>n <C-\><C-N>

" Force HJKL
  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <right> <nop>
  nnoremap <left> <nop>
  inoremap <up> <nop>
  inoremap <down> <nop>
  inoremap <left> <nop>
  inoremap <right> <nop>

" Jump to start and end of line from home row
  map H ^
  map L $

" Search remap
  nnoremap n nzzzv
  nnoremap N Nzzzv

"---------------------------------------------------------------------------------
" Formatters
"---------------------------------------------------------------------------------
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,arduino AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer clang-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2
autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2
autocmd FileType vim setlocal shiftwidth=2 softtabstop=2
autocmd FileType lua setlocal shiftwidth=2 softtabstop=2

" Enabling javascript codefmt
let g:coc_global_extensions = [
      \ 'coc-tsserver'
      \ ]

if !has('gui_running')
  set t_Co=256
endif

" Lightline
let g:lightline = {
            \ 'colorscheme': 'ayu',
            \ 'active': {
                \   'left': [ [ 'mode', 'paste' ],
                \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ],
                \   'right': [ ['lineinfo'],
                \              ['percent'],
                \              ['filetype']]
                \ },
                \'tabline' : {
                    \   'left': [ [ 'tabs' ] ] 
                    \ },
                    \ 'component_function': {
                        \   'filename': 'LightlineFilename',
                        \   'cocstatus': 'coc#status'
                        \ },
                        \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"base16 Configuration
let base16colorspace=256  " Access colors present in 256 colorspace. Disable this for pyWal

" OneDark Override
" let g:onedark_color_overrides = {
" \ "black": {"gui": "#19061f", "cterm": "235", "cterm16": "0" },
" \}

lua require("kd")
" nnoremap <C-_> :Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>
" nnoremap <C-_> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({sorting_strategy="ascending"})<cr>
nnoremap <C-_> <cmd>lua require('kd').curr_buff()<cr>
nnoremap <F5> :lua package.loaded.kd = nil <cr>:source /home/rdk/.config/nvim/init.vim <cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>lg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>gf <cmd> lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>gc <cmd> lua require('telescope.builtin').git_commits()<cr>

lua << EOF
require('lspconfig').tsserver.setup({})
require('lspconfig').ccls.setup({})
require('lspconfig').rust_analyzer.setup({})
EOF

" nvim-compe
" set completeopt=menu,menuone,noselect
" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

source ~/.config/nvim/settings.vim
