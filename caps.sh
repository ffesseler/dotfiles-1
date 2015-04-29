#!/bin/sh

# install seil
open /opt/homebrew-cask/Caskroom/seil/11.0.0/Seil.pkg

# remap capslock to F19
/Applications/Seil.app/Contents/Library/bin/seil set enable_capslock 1
/Applications/Seil.app/Contents/Library/bin/seil set keycode_capslock 80

# set alfred to use F19
defaults write com.runningwithcrayons.Alfred-Preferences hotkey.default -dict key -int 80
