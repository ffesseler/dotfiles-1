#!/bin/sh

cd ~/.dotfiles

git stash
git pull
git stash pop

# update submodules to head of master
git submodule foreach git reset origin/master --hard
git add .oh-my-zsh .vim/bundle/vundle
git commit -m "update submodules to master"

# update all software
brew update
brew upgrade
brew bundle

# link all the dotfiles
./link.sh

# update vim
vim +BundleInstall +qall

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
