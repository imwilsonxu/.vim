#!/usr/bin/env bash

VIM_PATH=$HOME/.vim

VIMRC_PATH="$HOME"/.vimrc
if [ -f "$VIMRC_PATH" ]; then
    mv "$VIMRC_PATH" "$VIMRC_PATH".bak
fi
echo 'source ~/.vim/vimrcs/vundle.vim
source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/typos.vim
source ~/.vim/vimrcs/filetypes.vim' > "$VIMRC_PATH"

AUTOLOAD_PATH="$VIM_PATH/autoload"
if [ ! -d "$AUTOLOAD_PATH" ]; then
    mkdir -p "$AUTOLOAD_PATH"
fi
curl -LSso "$AUTOLOAD_PATH"/pathogen.vim https://tpo.pe/pathogen.vim

BUNDLE_PATH="$VIM_PATH/bundle"
if [ ! -d "$BUNDLE_PATH" ]; then
    mkdir -p "$BUNDLE_PATH"
fi
if [ ! -d "$BUNDLE_PATH"/vundle ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git "$BUNDLE_PATH"/vundle
fi

vim +PluginInstall +qall

if [ -d "$BUNDLE_PATH"/vundle/YouCompleteMe ]; then
    sh "$BUNDLE_PATH"/vundle/YouCompleteMe/install.sh --all
fi

echo "Done!"
