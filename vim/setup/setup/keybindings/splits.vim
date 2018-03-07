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
noremap <leader>tn :tabnext %<cr>
noremap <leader>tp :tabpreviouse %<cr>
noremap <leader>tv :tabnew %<cr>
