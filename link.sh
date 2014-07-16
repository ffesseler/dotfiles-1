#!/bin/sh

for filename in .*; do
  if [ $filename != ".git" ] && [ $filename != ".gitmodules" ]  && [ $filename != "." ] && [ $filename != ".." ]
  then
    if [ -d $filename ]
    then
      if [ ! -d ~/$filename ]
      then
        ln -s ~/.dotfiles/$filename ~/$filename
      fi
    else
      if [ ! -f ~/$filename ]
      then
        ln $filename ..
      fi
    fi
  fi
done
