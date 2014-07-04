#!/bin/sh

cd ~/

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# install all the things
brew update
brew upgrade
brew bundle

# clone the dotfiles
git clone git@github.com:danshearmur/dotfiles.git .dotfiles
cd ~/.dotfiles

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

# osx prefs
./osx.sh

# remap capslock to F19
/Applications/Seil.app/Contents/Library/bin/seil set keycode_capslock 80

# set alfred to use F19
defaults write com.runningwithcrayons.Alfred-Preferences hotkey.default -dict key -int 80

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

# reboot
sudo reboot now
