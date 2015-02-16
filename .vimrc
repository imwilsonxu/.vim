" Treasures in Vim

" Com'on, it's 21 century now.
set nocompatible

" Trigger magic in ~/.vim/bundle
call pathogen#infect()

" Vundle ===================================================

" Vundle via https://github.com/gmarik/vundle
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle "gmarik/vundle"

" http://ethanschoonover.com/solarized/vim-colors-solarized
Bundle "altercation/vim-colors-solarized"
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

inoremap [] []<esc>i
inoremap {} {}<esc>i
inoremap () ()<esc>i
inoremap <> <><esc>i
inoremap "" ""<esc>i
inoremap '' ''<esc>i
inoremap %% %%<esc>i
inoremap `` ``<esc>i
inoremap ** **<esc>i
inoremap \|\| \|\|<esc>i

" Command line
Bundle "Lokaltog/vim-powerline"
set laststatus=2
set encoding=utf-8
" Play nice with command line.
set t_Co=256
let g:Powerline_colorscheme = "solarized256"

" NERDTree
Bundle "scrooloose/nerdtree"
let NERDTreeIgnore=['\.pyc$']
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
"map <F2> :NERDTreeToggle<CR>
" Auto open NERDTree if fire Vim only.
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
Bundle 'jistr/vim-nerdtree-tabs'

" CtrlP
Bundle 'kien/ctrlp.vim'
set wildignore=*.dll,*.o,*.obj,*.exe,*.pyc,*.jpg,*.gif,*.png,*.sqlite
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" SudoEdit
Bundle 'chrisbra/SudoEdit.vim'
" In terminal, <c-s> sends the signal SIGSTOP, which was caught by system before vim.
" Workaround: echo "stty -ixon" >> ~/.bashrc
map <silent> <C-s> :SudoWrite<CR>

Bundle 'vim-scripts/AutoComplPop'
" Set popup colorscheme
"highlight Pmenu ctermfg=black ctermbg=gray
"highlight PmenuSel ctermfg=lightred ctermbg=brown

" Surround
Bundle 'Kris2k/matchit'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

" NerdCommenter
Bundle 'scrooloose/nerdcommenter'

" Ruby
"Bundle 'vim-ruby/vim-ruby'

" Python
"
Bundle "mitsuhiko/vim-jinja"
Bundle "hdima/python-syntax"

" Need pep8 and flake8 to check python syntax.
Bundle 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['python', 'html', 'javascript', 'css', 'md', 'markdown'] }
"fun! <SID>StripTrailingWhitespaces()
    "let l = line(".")
    "let c = col(".")
    "%s/\s\+$//e
    "call cursor(l, c)
"endfun
"autocmd BufWritePre *.rb, *.py, *.js, *.css <buffer> :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.py :%s/\s\+$//e

Bundle "mattn/emmet-vim"

" End Vundle ================================================

filetype plugin indent on     " required!
syntax on

" Space is bigger that ','
let mapleader=" "

set expandtab
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
autocmd BufRead, BufNewFile *.rb, *.html set shiftwidth=2

set autoindent
set smartindent
" These keywords start an extra indent in the next line when 'smartindent' or 'cindent' is set.
"set cinwords=if,elif,else,for,while,with,try,except,finally,def,class

" Set visual cue for folding.
"set foldcolumn=5

" Display
"
" Show cursorline to indicate insert mode.
" See also guicursor
autocmd InsertEnter,InsertLeave * set cul!
" Wrap is kind of werid =.=
set nowrap
" 132*43 looks better 80*43
"set lines=43
"set columns=132
" Annoying while copy text in Vim.
set number
" Actually, rule is not a must.
set ruler
" Set terminal title as the first openned file name.
set title
" Vim suggests turning off if terminal is slow.
set showcmd
" No noise, pls
set visualbell
set noerrorbells
" Trim trailing spaces while formating
"nnoremap <silent> gg=G gg=G:%s/\s\+$//g<cr>``
set nofoldenable

"set scrolloff=5

" Switch to tab left/right.
nnoremap th :tabp<cr>
nnoremap tl :tabn<cr>
nnoremap <left> <esc>:tabp<cr>
nnoremap <right> <esc>:tabn<cr>

" Move current tab left/right.
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

" Searching
set hlsearch
set incsearch
" smartcase need to turn on ignorecase
set ignorecase
set smartcase
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" No swap and Backup
set noswapfile
set nobackup
set nowritebackup
" Write to swap file after 100 keystrokes.
"set updatecount=100

" Line(s) indent.
vmap . >
vmap , <

set numberwidth=5

" Copy/paste to X CLIPBOARD, "+y" is better.
"map <silent> <leader>cp :w !xsel -i -p<CR>
"map <silent> <leader>pp :r!xsel -p<CR>

" Make backspace more flexible
set backspace=indent,eol,start

set pastetoggle=<F3>

" Return to last file using alt + left-arrow, eclipse style.
nnoremap <M-left> :e#<cr>

" more useful tab completion
set wildmenu
set wildmode=list:longest

" Save more command history.
set history=1000

" markdown
"
"autocmd FileType markdown map <F5> :!sundown % > /tmp/md.html<cr>
"au BufRead,BufNewFile *.md set filetype=markdown

" javascript
"
" Format bookmarklet codes.
"autocmd FileType javascript nnoremap <F9> :g/^\s*\/\//d<cr>:%s/\v\s+/%20/g<cr>:%s/\n//g<cr>:%s/"/\&quot;/g<cr>:%s/\(.*\)/<a href="javascript:\1">test<\/a>/g<cr>:noh<cr>

" json
" format json.
"nnoremap <f5> :%!python -m json.tool<CR>:w<CR>

" typos
"
ab dont' don't
ab inconveneice inconveniece
ab slef self
ab sefl self
ab contetn content
ab itme item
ab lenght length
ab heigth height
ab wsig wsgi
ab compnay company
ab improt import
ab cloen clone

" My favorites
"
nnoremap <space><space> :tabe 
" enhance default gf: open file in a new tab
nnoremap gf :tabe <cfile><cr>
" enhance default gd: without jumping around
nnoremap gd magd`a
" Replace word(s) under cursor from last yank/cut
" Yank/cut a word without trailing space.
" Have no idea why only "1 works for 'dw'
nnoremap du ma%d'a
nnoremap rw viwp :call setreg('"', getreg('0')) <CR>
nnoremap r' vi'p :call setreg('"', getreg('0')) <CR>
nnoremap r" vi"p :call setreg('"', getreg('0')) <CR>
nnoremap r[ vi[p :call setreg('"', getreg('0')) <CR>
nnoremap r( vi(p :call setreg('"', getreg('0')) <CR>
nnoremap r{ vi{p :call setreg('"', getreg('0')) <CR>
" Paste from last yank/cut
nnoremap gp "0p
" Save my fingers.
nnoremap qq :q<cr>
nnoremap qaa :qa!<cr>
nnoremap ; :
vnoremap ; :
nnoremap gh ^
nnoremap gl $
" Move from window to window.
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
" Move cursor in insert mode.
inoremap <c-l> <esc>la
inoremap <c-h> <esc>i
" <Esc> is too far away from my fingers.
inoremap <Esc> <Esc>:w<CR>:noh<CR>
nmap \ <esc>:noh<cr>:w<cr>
" Easy saving.
imap zz <esc>ZZ
nmap zz ZZ

""" http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns/235970#235970
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" Local config
if filereadable(".vimrc.local") | source .vimrc.Local | endif

set fileencodings=ucs-bom,utf-8,euc-cn,cp936,gb18030,latin1

" Delete a whole <tag>
autocmd FileType html map <leader>d <esc>ma%d'a

" http://vim.wikia.com/wiki/Fix_broken_arrow_key_navigation_in_insert_mode
"set term=builtin_ansi
