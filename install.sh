#!/bin/sh

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# install all the things
brew update
brew upgrade
brew bundle

# dotfile submodules
git submodule init
git submodule update

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

# use zsh
chsh -s /bin/zsh

# setup vim
vim +BundleInstall +qall

# set up ruby/rbenv
rbenv install 2.1.2
rbenv global 2.1.2

# grunt/bower/yo
npm install -g grunt-cli bower generator-webapp generator-angular generator-react
