"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python

let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JavaScript

au FileType javascript setl fen
au FileType javascript setl nocindent

" Format bookmarklet codes.
" autocmd FileType javascript nnoremap <F9> :g/^\s*\/\//d<cr>:%s/\v\s+/%20/g<cr>:%s/\n//g<cr>:%s/"/\&quot;/g<cr>:%s/\(.*\)/<a href="javascript:\1">test<\/a>/g<cr>:noh<cr>

" Format json.
"nnoremap <f5> :%!python -m json.tool<CR>:w<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML

" Delete a whole <tag>
autocmd FileType html map <leader>d <esc>ma%d'a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoffeeScript

au FileType gitcommit call setpos('.', [0, 1, 1, 0])


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shell

if exists('$TMUX')
    set term=screen-256color
endif
