" Treasures in Vim

" Com'on, it's 21 century now.
set nocompatible

" Trigger magic in ~/.vim/bundle
call pathogen#infect()

" Vimundle ===================================================

" Vimundle via https://github.com/gmarik/vundle
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'

" Windows
"
Bundle 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$']
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Bundle 'vim-scripts/taglist.vim'
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_Format = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
"autocmd vimenter * if !argc() | Tlist | endif

Bundle 'vim-scripts/mru.vim'
let MRU_Auto_Close = 0
let MRU_Window_Height = 5
"autocmd vimenter * if !argc() | MRU | endif

" General Editing

Bundle 'chrisbra/SudoEdit.vim'
" In terminal, <c-s> sends the signal SIGSTOP, which was caught by system
" before vim. 
" Workaround: echo "stty -ixon" >> ~/.bashrc
map <silent> <C-s> :SudoWrite<CR>
cmap w!! %!sudo tee > /dev/null %

Bundle 'vim-scripts/AutoComplPop'
Bundle 'Kris2k/matchit'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'

" Coding
"
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'

" https://github.com/mbbill/undotree
Bundle 'mbbill/undotree'
nnoremap <F5> :UndotreeToggle<cr>

Bundle 'mattn/zencoding-vim'

" Dev Vim Scripts
"
Bundle 'vim-scripts/Decho'
Bundle 'xolox/vim-reload'

" Commented out after install, still figuring... 
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
"Bundle "garbas/vim-snipmate"
Bundle 'imwilsonxu/vim-snipmate'

Bundle 'Jinja'
Bundle 'TaskList.vim'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'pydoc.vim'
"Bundle 'supertab'
" End Vimundle ================================================

filetype plugin indent on     " required!

" Space is bigger that ','
let mapleader=" "

" Tab
"
" Say good bye to tab, though my co-workers must hate me.
set expandtab
set autoindent
set shiftwidth=4
set tabstop=4
set softtabstop=4

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
" Always show the status line
set laststatus=2
" Better status line
set statusline=%<%04n\ %t%(\ %m%r%y[%{&ff}][%{&fenc}]\ \ %{mode()}%)\ %a%=\ col\ %v\ \ line\ %l/%L\ %p%%
" Make selected item more readable in popup menu, especially using back as
" bg-color.
highlight PmenuSel ctermbg=lightgreen gui=bold
" Trim trailing spaces while formating
"nnoremap <silent> gg=G gg=G:%s/\s\+$//g<cr>``

" Navigation
"
" Do not have to reach first/last line to roll
"set scrolloff=5
" More intuitive
"nnoremap <c-j> <c-y>
"nnoremap <c-k> <c-e>
" Tab page navigation
nnoremap th :tabp<cr>
nnoremap tl :tabn<cr>
nnoremap <left> <esc>:tabp<cr>
nnoremap <right> <esc>:tabn<cr>

" Searching
"
set hlsearch
set incsearch
" smartcase need to turn on ignorecase
set ignorecase
set smartcase

" Swap and Backup
"
" I hate swap files, so does dropbox.
set noswapfile
set nobackup
set nowritebackup
" Write to swap file after 100 keystrokes.
"set updatecount=100

" Editing
"
" Copy to X CLIPBOARD
map <leader>cp :w !xsel -i -p<CR>
" Paste from X CLIPBOARD
map <leader>pp :r!xsel -p<CR>
"
nmap <leader>j `. 
" Make backspace a more flexible
set backspace=indent,eol,start
" Ignore files
set wildignore=*.dll,*.o,*.obj,*.exe,*.pyc,*.jpg,*.gif,*.png
" Sweet all the time ...
" How can I tweak something like &paste ? <no> : []<esc>i
inoremap [] []<esc>i
inoremap {} {}<esc>i
inoremap () ()<esc>i
inoremap <> <><esc>i
inoremap "" ""<esc>i
inoremap '' ''<esc>i
inoremap %% %%<esc>i
inoremap `` ``<esc>i
inoremap \|\| \|\|<esc>i
" but for paste? here is the fix.
nnoremap <F3> :set paste!<Bar>set paste?<cr>
" Return to last file using alt + left-arrow, mimic eclipse.
nnoremap <M-left> :e#<cr>
" more useful tab completion
set wildmenu
set wildmode=list:longest
" Easier way to indent codes left/right.
vmap . >
vmap , <
nmap <tab> >>
nmap <s-tab> <<

" Coding: php
"
" Run in cli
"autocmd FileType php nnoremap <F9> :!/opt/lampp/bin/php %<cr>
" Check syntax
"autocmd FileType php map <F2> :w\|!php -l %<cr>
" Phpunit
"autocmd FileType php nnoremap <c-t> :!phpunit %<cr>

" Coding: python
autocmd FileType python map <F2> :w\|!python %<cr>
autocmd FileType python map <F6> :!nosetests -s ..<cr>
"autocmd FileType python set smartindent

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
nnoremap <f5> :%!python -m json.tool<CR>:w<CR>

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
imap jj <esc>
"norema \ :noh<cr>:w<cr><esc>
" Easy saving.
imap zz <esc>:w<CR>
nmap zz :w<CR>

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
if filereadable(".vimrc.local") | source .vimrc.Local |  endif

set numberwidth=5

" http://vim.wikia.com/wiki/Using_tab_pages
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

set fileencodings=ucs-bom,utf-8,euc-cn,cp936,gb18030,latin1

colorscheme Tomorrow-Night
