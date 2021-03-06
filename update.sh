#!/bin/sh

cd ~/.dotfiles

git stash
git pull
git stash pop

# update submodules to head of master
git submodule foreach git reset origin/master --hard
git add .oh-my-zsh .vim/bundle/vundle
git commit -m "update submodules to master"

# update/install software with homebrew
./bundle.sh

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

# docker
./docker.sh

# python
./python.sh
