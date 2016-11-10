" Com'on, it's 21 century now.
" be iMproved, required
set nocompatible
filetype off

" Trigger magic in ~/.vim/bundle
call pathogen#infect()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" http://ethanschoonover.com/solarized/vim-colors-solarized
"Plugin "altercation/vim-colors-solarized"
"if has('gui_running')
	"set background=light
"else
	"set background=dark
"endif
"colorscheme solarized
"let g:solarized_termcolors=256

" Command line
Plugin 'Lokaltog/vim-powerline'
set laststatus=2
set encoding=utf-8
" Play nice with command line.
"set t_Co=256
let g:Powerline_colorscheme = "solarized256"

" NERDTree
Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$']
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
"map <F2> :NERDTreeToggle<CR>
" Auto open NERDTree if fire Vim only.
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\.pyc$', '\.o$', '\~$']
Plugin 'jistr/vim-nerdtree-tabs'

" CtrlP
"Plugin 'kien/ctrlp.vim'
"https://github.com/ctrlpvim/ctrlp.vim
Plugin 'ctrlpvim/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "\ 'file': '\v\.(exe|so|dll)$',
  "\ }

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" SudoEdit
Plugin 'chrisbra/SudoEdit.vim'
" In terminal, <c-s> sends the signal SIGSTOP, which was caught by system before vim.
" Workaround: echo "stty -ixon" >> ~/.bashrc
map <silent> <C-s> :SudoWrite<CR>

Plugin 'vim-scripts/AutoComplPop'
" Set popup colorscheme
highlight Pmenu ctermfg=black ctermbg=gray
highlight PmenuSel ctermfg=lightred ctermbg=brown

" Surround
Plugin 'Kris2k/matchit'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" NerdCommenter
Plugin 'scrooloose/nerdcommenter'

" Ruby
"Plugin 'vim-ruby/vim-ruby'

" Brew
Plugin 'xu-cheng/brew.vim'

" Python
"
Plugin 'mitsuhiko/vim-jinja'
Plugin 'hdima/python-syntax'
Plugin 'klen/python-mode'
"let g:pymode_lint_config = '$HOME/.pylint.rc'
"let g:pymode_options_max_line_length=120
"let g:pymode_doc=0
"let g:pymode_rope=0
"let g:pymode_lint_on_fly=0

" Need pep8 and flake8 to check python syntax.
Plugin 'scrooloose/syntastic'
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

Plugin 'mattn/emmet-vim'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
