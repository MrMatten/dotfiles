set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'chriskempson/base16-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'scrooloose/nerdtree'
Plugin 'mtscout6/vim-cjsx'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elmcast/elm-vim'

call vundle#end()            
filetype plugin indent on

source ~/.vim/setup/autocmd.vim
source ~/.vim/setup/dash.vim
source ~/.vim/setup/basics.vim
source ~/.vim/setup/keybindings.vim
source ~/.vim/setup/silversearcher.vim
source ~/.vim/setup/selecta.vim
source ~/.vim/setup/silversearcher.vim
source ~/.vim/setup/selecta.vim

