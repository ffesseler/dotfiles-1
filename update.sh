#!/bin/sh

cd ~/.dotfiles

git stash
git pull
git stash pop

# update submodules to head of master
git submodule foreach git pull origin master
git add .oh-my-zsh .vim/bundle/vundle
git commit -m "update submodules to master"

# update all software
brew update
brew upgrade
brew bundle

# link all the dotfiles
for filename in .*; do
  if [ $filename != ".git" ] && [ $filename != "." ] && [ $filename != ".." ]
  then
    if [ -d $filename ]
    then
      ln -s ~/.dotfiles/$filename ~/$filename
    else
      ln $filename ..
    fi
  fi
done

# update vim
vim +BundleInstall +qall

# node
./node.sh

# ruby stuff
./ruby.sh

# osx prefs
./osx.sh

# capslock
./caps.sh
