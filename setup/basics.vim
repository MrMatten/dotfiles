let mapleader = ","
set nocompatible                  " Must come first because it changes other options.
set timeout timeoutlen=1000 ttimeoutlen=100
filetype plugin indent on

syntax enable
let base16colorspace=256
try
  colorscheme base16-tomorrow
catch
endtry

" Make jsx available in .js files
let g:jsx_ext_required = 0

" Elm syntax settings for Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1

set number " Turn on line numbers 
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set ruler " Show cursor position

set showcmd " Display incomplete commands
set showmode " Display the mode you're in

set incsearch " Highlight matches as you type
set hlsearch " Highlight matches

set wrap " Turn on line wrapping
set showmatch 
set title

set visualbell " No beeping

set nobackup " Don't make a backup before overwriting a file
set nowritebackup " And again
set noswapfile
set backupskip=/tmp/*,/private/tmp*
set undodir=~/.vim/undo

set tabstop=2 " Global tab width
set backspace=2
set shiftwidth=2 " The same
set smarttab
set expandtab " Use spaces instead of tabs
set laststatus=2 " Show the status line all the time
" Usefull information at the bottom of the screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

set autoindent " Indent at the same level as previous line
set smartindent
