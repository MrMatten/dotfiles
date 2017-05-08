execute pathogen#infect()
syntax on
filetype plugin indent on
call pathogen#helptags()
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Make jsx syntax available on .js files
let g:jsx_ext_required = 0

" Autocomplete on startup
let g:neocomplete#enable_at_startup = 1

" Search key
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
