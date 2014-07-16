#!/bin/sh

cd ~/

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# clone the dotfiles
git clone git@github.com:danshearmur/dotfiles.git .dotfiles
cd ~/.dotfiles

# dotfile submodules
git submodule init
git submodule update

# install all the things
brew update
brew upgrade
brew bundle

# link all the dotfiles
./link.sh

# use zsh
chsh -s /bin/zsh

# setup vim
vim +BundleInstall +qall

# node
./node.sh

# ruby stuff
./ruby.sh

# osx prefs
./osx.sh

# capslock
./caps.sh

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
