#!/bin/sh

cd ~/

# install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# clone the dotfiles
git clone git@github.com:danshearmur/dotfiles.git .dotfiles
cd ~/.dotfiles

# dotfile submodules
git submodule init
git submodule update

# install all the things
./bundle.sh

# link all the dotfiles
./link.sh

# use zsh
chsh -s /usr/local/bin/zsh

# setup vim
vim +BundleInstall +qall

# setup iterm
open smyck/Smyck.itermcolors

# node
./node.sh

# ruby stuff
./ruby.sh

# go stuff
./golang.sh

# osx prefs
./osx.sh

# capslock
./caps.sh

# docker
./docker.sh

# python
./python.sh

# generate ssh keys
SSH=~/.ssh
if [ ! -d $SSH ]
then
  mkdir $SSH
fi
cd $SSH
if [ ! -f $SSH/id_rsa ]
then
  ssh-keygen -t rsa -C "dan.shearmur@gmail.com"
fi

# reboot (for seil)
sudo reboot now
