" Com'on, it's 21 century now.
" be iMproved, required
set nocompatible
filetype off

" Trigger magic in ~/.vim/bundle
call pathogen#infect()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized colorscheme for vim
" http://ethanschoonover.com/solarized/vim-colors-solarized
"
Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
" use the degraded 256 colorscheme
" let g:solarized_termcolors=256


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A light and configurable statusline/tabline for Vim
" https://github.com/itchyny/lightline.vim
"
Plugin 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree and NERDTree tabs
" https://github.com/scrooloose/nerdtree
" https://github.com/jistr/vim-nerdtree-tabs
" https://github.com/scrooloose/nerdcommenter
"
Plugin 'scrooloose/nerdtree'
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.pyc$', '\.o$', '\~$']
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'scrooloose/nerdcommenter'
let g:NERDTrimTrailingWhitespace = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy file, buffer, mru, tag, etc finder.
" https://github.com/ctrlpvim/ctrlp.vim
"
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_cmd = 'CtrlP'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee|\v[\/]\.(git|hg|svn)$'
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit Files using sudo or su or any other tool.
" https://github.com/chrisbra/SudoEdit.vim
"
Plugin 'chrisbra/SudoEdit.vim'
" In terminal, <c-s> sends the signal SIGSTOP, which was caught by system before vim.
" Workaround: echo "stty -ixon" >> ~/.bashrc
map <silent> <c-s> :SudoWrite<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Edit Files using sudo or su or any other tool.
" https://github.com/vim-scripts/AutoComplPop
"
" Plugin 'vim-scripts/AutoComplPop'
" Set popup colorscheme
" highlight Pmenu ctermfg=black ctermbg=gray
" highlight PmenuSel ctermfg=lightred ctermbg=brown


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A code-completion engine for Vim
" https://github.com/Valloric/YouCompleteMe
"
Plugin 'Valloric/YouCompleteMe'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/Kris2k/matchit
" https://github.com/tpope/vim-surround
" https://github.com/tpope/vim-repeat
"
Plugin 'Kris2k/matchit'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/vim-ruby/vim-ruby
" https://github.com/tpope/vim-rails
"
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'tpope/vim-rails'

" Brew
Plugin 'xu-cheng/brew.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Python.
" https://github.com/klen/python-mode
"
Plugin 'mitsuhiko/vim-jinja'
Plugin 'hdima/python-syntax'
Plugin 'klen/python-mode'
"let g:pymode_lint_config = '$HOME/.pylint.rc'
"let g:pymode_options_max_line_length=120
"let g:pymode_doc=0
"let g:pymode_rope=0
"let g:pymode_lint_on_fly=0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax checking hacks for vim.
" https://github.com/klen/python-mode
"
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ 'mode': 'active',
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet — the essential toolkit for web-developers
" https://github.com/mattn/emmet-vim
"
Plugin 'mattn/emmet-vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
"
Plugin 'airblade/vim-gitgutter'


" Plugin 'xolox/vim-misc'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Extended session management for Vim
" https://github.com/xolox/vim-session
"
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
