augroup skeletons
  au!
  autocmd BufNewFile *.* silent! execute '0r $HOME/.config/nvim/lua/templates/skeleton.'.expand("<afile>:e")
augroup END
