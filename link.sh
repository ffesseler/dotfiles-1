#!/bin/sh

for filename in .*; do
  if [ $filename != ".git" ] && [ $filename != ".gitmodules" ]  && [ $filename != "." ] && [ $filename != ".." ]
  then
    if [ ! -d ~/$filename ] && [ ! -f ~/$filename ]
    then
      ln -s ~/.dotfiles/$filename ~/$filename
    fi
  fi
done

# for neovim
ln -s ~/.vim ~/.nvim
ln -s ~/.vimrc ~/.nvimrc
