# .vim

My .vim folder since 2009.

## Install

    cd && git clone https://github.com/imwilsonxu/.vim
    cd .vim && ./install.sh

## Files

* vundle.vim: setup vim plugins via vundle.vim, must be top of .vimrc.
* basic.vim: basic config.
* filetypes.vim: for diff files, such as python, ruby, etc.
* typos.vim: for typos.
* bundle/.gitignore: ignore new plugins in repos.

## Plugins

### General

* vim-pathogen: manage runtimepath.
* Vundle.vim: manage vim plugins.
* scrooloose/nerdtree: tree explorer.
* jistr/vim-nerdtree-tabs: tabs with tree explorer.
* chrisbra/SudoEdit.vim
* vim-scripts/AutoComplPop
* Kris2k/matchit
* tpope/vim-surround
* tpope/vim-repeat
* kien/ctrlp.vim: fuzzy file, buffer, mru, tag, etc finder
* altercation/vim-colors-solarized
* Lokaltog/vim-powerline

### Programming

* scrooloose/nerdcommenter
* scrooloose/syntastic
* Python
    * mitsuhiko/vim-jinja
    * hdima/python-syntax
* Ruby
    * vim-ruby/vim-ruby

### Deprecated

* vim-scripts/taglist.vim
* vim-scripts/mru.vim
* tpope/vim-fugitive
* mattn/zencoding-vim
* mbbill/undotree
* vim-scripts/Decho
* xolox/vim-reload
