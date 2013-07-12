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

" Just for fun
"
"Bundle 'uguu-org/vim-matrix-screensaver'

" Play with shell inside Vim. 
Bundle "acx0/Conque-Shell"

" Colorschema
Bundle "flazz/vim-colorschemes"
" Make gVim-only color schema looks pretty in console.
Bundle "CSApprox"
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme desert256

Bundle 'delimitMate.vim'

" Better status line
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
set encoding=utf-8
" Play nice with command line.
set t_Co=256
let g:Powerline_colorscheme = "solarized256"

" NERDTree
Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$']
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
"map <F2> :NERDTreeToggle<CR>
" Auto open NERDTree if fire Vim only.
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
Bundle 'jistr/vim-nerdtree-tabs'

" TaskList
"Bundle 'vim-scripts/taglist.vim'
"let Tlist_Enable_Fold_Column = 0
"let Tlist_Compact_Format = 1
"let Tlist_File_Fold_Auto_Close = 1
"let Tlist_GainFocus_On_ToggleOpen = 1
"let Tlist_Use_Right_Window = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Show_One_File = 1
"autocmd vimenter * if !argc() | Tlist | endif

" CtrlP
Bundle 'kien/ctrlp.vim'

" EasyMotion
Bundle 'Lokaltog/vim-easymotion'
" ffb / ffw
let g:EasyMotion_leader_key = 'ff'

" MRU
Bundle 'vim-scripts/mru.vim'
let MRU_Auto_Close = 0          " Keep MRU window open
let MRU_Window_Height = 5
let MRU_Max_Entries = 100 
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'
let MRU_Max_Menu_Entries = 20   " Less, faster.
" Shortcut to MRU window, the bottom-right window.
noremap ` <c-w><c-b>
"autocmd vimenter * if !argc() | MRU | endif

" Error Caught deadly signal SEGV
"Bundle 'Command-T' 

" SudoEdit
Bundle 'chrisbra/SudoEdit.vim'
" In terminal, <c-s> sends the signal SIGSTOP, which was caught by system before vim. 
" Workaround: echo "stty -ixon" >> ~/.bashrc
map <silent> <C-s> :SudoWrite<CR>

" SuperTab
Bundle 'ervandew/supertab.git'
Bundle 'vim-scripts/AutoComplPop'
" Better popup color schema.
highlight Pmenu ctermfg=white ctermbg=black
highlight PmenuSel ctermfg=lightred ctermbg=brown

" Surround
Bundle 'Kris2k/matchit'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

" NerdCommenter
Bundle 'scrooloose/nerdcommenter'

" Ruby
"Bundle 'vim-ruby/vim-ruby'

" Python
"Bundle "davidhalter/jedi-vim"      " Too slow
Bundle "Jinja"
Bundle "python.vim"
Bundle "indent/python.vim"
"Bundle "vim-scripts/pydoc.vim"

" JavaScript
"Bundle 'vim-coffee-script'

" Git
"Bundle 'tpope/vim-fugitive'

" Need pep8 and flake8 to check python syntax.
Bundle 'scrooloose/syntastic'

" https://github.com/mbbill/undotree
"Bundle 'mbbill/undotree'
"nnoremap <F5> :UndotreeToggle<cr>

" Zencoding: HTML
Bundle 'mattn/zencoding-vim'

"Bundle 'dbsr/vimfox'

" Dev Vim Scripts
"
"Bundle 'vim-scripts/Decho'
Bundle 'xolox/vim-reload'
let g:reload_on_write = 0

" Snippets
" Commented out after install, still figuring... 
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "imwilsonxu/snipmate-snippets"

"Bundle "TaskList.vim"
"Bundle "fholgado/minibufexpl.vim"

" End Vundle ================================================

filetype plugin indent on     " required!

" Space is bigger that ','
let mapleader=" "

set expandtab
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4

autocmd FileType ruby, javascript autocmd set shiftwidth=2
autocmd FileType ruby, javascript autocmd set tabstop=2
autocmd FileType ruby, javascript autocmd set softtabstop=2

set cinwords=if,elif,else,for,while,with,try,except,finally,def,class

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

" Eclipse style.
"nnoremap <c-j> <c-y>
"nnoremap <c-k> <c-e>

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

" Make backspace a more flexible
set backspace=indent,eol,start
" Ignore files
set wildignore=*.dll,*.o,*.obj,*.exe,*.pyc,*.jpg,*.gif,*.png

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
set pastetoggle=<F3>

" Return to last file using alt + left-arrow, eclipse style.
nnoremap <M-left> :e#<cr>

" more useful tab completion
set wildmenu
set wildmode=list:longest

" Save more command history.
set history=1000

" Python
autocmd FileType python map <F2> :w\|!python %<cr>
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType ruby, python, javascript, css autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" markdown
"
autocmd FileType markdown map <F5> :!sundown % > /tmp/md.html<cr>
au BufRead,BufNewFile *.md set filetype=markdown

" Coding: javascript
"
" Format bookmarklet codes.
autocmd FileType javascript nnoremap <F9> :g/^\s*\/\//d<cr>:%s/\v\s+/%20/g<cr>:%s/\n//g<cr>:%s/"/\&quot;/g<cr>:%s/\(.*\)/<a href="javascript:\1">test<\/a>/g<cr>:noh<cr>

" Coding: ruby
"
"autocmd FileType ruby map <F2> :w\|!ruby %<cr>
autocmd FileType ruby map <F2> :w\|!ruby %<cr>

" Coding: json
" format json.
"nnoremap <f5> :%!python -m json.tool<CR>:w<CR>

" typos
"
ab dont' don't
ab inconveneice inconveniece
ab pythong python
ab Pythong Python
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

""" https://github.com/ryanb/dotfiles

" Don't use Ex mode, use Q for formatting
map Q gq

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" Local config
if filereadable(".vimrc.local") | source .vimrc.Local | endif

set fileencodings=ucs-bom,utf-8,euc-cn,cp936,gb18030,latin1

autocmd FileType html map <leader>d <esc>ma%d'a

" Delete what matched last search
nnoremap <leader>d :%s///g
