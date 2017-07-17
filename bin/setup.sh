#!/usr/bin/env bash

# copy dotfiles to home directory
cp .aliases ~
cp .bash_profile ~
cp .shortcuts ~
cp .tmux.conf ~
cp .vimbundle ~
cp .vimrc ~

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# download all the vim bundles
sh bin/vim-bundle.sh
