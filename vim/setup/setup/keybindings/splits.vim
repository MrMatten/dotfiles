" Easy split navitgation remapping splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Split resizing
noremap - <C-W><
noremap + <C-W>>

noremap <A-j> <C-W>-
noremap <A-k> <C-W>+

" Open splits with leader
noremap <leader>vs :vs %<cr>
noremap <leader>ss :split %<cr>

" Tabs
noremap <leader>tr :tabNext <cr>
noremap <leader>tp :tabprevious <cr>
noremap <leader>tn :tabnew <cr>
