#!/bin/sh

# set up ruby/rbenv
rbenv install -s 2.1.2
rbenv global 2.1.2

# gems
gem update --system
gem update
yes | gem install bundle sass haste
