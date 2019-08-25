function! SetScreenTitle()
    silent !clear
    let titlestring = "Program: vim | File: " . expand("%") . ""
    let cmd = "!~/Scripts/name.sh \"".titlestring."\""
    silent execute(cmd)
    redraw!
endfunction

autocmd BufEnter * call SetScreenTitle()

autocmd Filetype gitcommit setlocal spell textwidth=72
au BufRead,BufNewFile *.hbs set filetype=html.handlebars
au BufRead,BufNewFile *.handlebars set filetype=html.handlebars

" Rename current file, thanks Gary Bernhardt via Ben Orenstein
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

noremap <leader>ren :call RenameFile()<cr>
nnoremap <leader>rm :call delete(expand('%')) \| bdelete!<CR>

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

cnoremap %% <C-R>=expand('%:h').'/'<cr>
