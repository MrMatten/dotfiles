execute pathogen#infect()
syntax enable 
let base16colorspace=256
try
    colorscheme base16-tomorrow 
catch
endtry
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

" Set line numbers as default
set number

" Change color on line numbers
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
