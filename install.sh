#!/bin/sh

cd ~/
# get oh-my-zsh
rm .zshrc
rm .vim -rf
rm .vimrc
rm .tmux.conf
rm .dircolors
curl -L http://install.ohmyz.sh | sh
git clone https://github.com/scusy/dotfiles .cdots
ln -s  .cdots/vimrc .vimrc
ln -s  .cdots/vim .vim
ln -s  .cdots/tmux.conf .tmux.conf
ln -s  .cdots/zshrc .zshrc
ln -s  .cdots/dircolors .dircolors
#get noebundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh


