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

" Silver_searcher ag
let g:ackprg = 'ag --nogroup --nocolor --column'

" Selecta to fuxxy search
" Run a given vim command on the results of fuzzy selecting from a given shell command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " .
       a:selecta_args)
   catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory. Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find  * -type f", "", ":e")<cr>
