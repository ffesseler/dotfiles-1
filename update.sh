#!/bin/sh

cd ~/.dotfiles

git pull

# update all software
brew update
brew upgrade
brew bundle

# update submodules to head of master
git submodule foreach git pull origin master
git add .oh-my-zsh .vim/bundle/vundle
git commit -m "update submodules to master"

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

# setup vim
vim +BundleInstall +qall
