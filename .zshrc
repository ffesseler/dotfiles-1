# OH_MY_ZSH stuff
#----------------
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="avit"
export DISABLE_AUTO_UPDATE=true
plugins=(git history-substring-search ruby rbenv redis-cli)
source $ZSH/oh-my-zsh.sh
# turn off autocorrection
unsetopt correct_all
# FIX https://github.com/robbyrussell/oh-my-zsh/pull/1355
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down

# PATHS
#------
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.node/bin:$HOME/local/node/bin:$PATH
export NODE_PATH=$HOME/.node/bin:$HOME/.node/lib/node_modules:$NODE_PATH
# go
export GOROOT=`go env GOROOT`
export GOPATH=~/src/gocode
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin
# make local binaries have priority (e.g. stuff installed with homebrew)
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# VIM
#----
export SVN_EDITOR=vi
export EDITOR='mvim -f'

source ~/.dotfiles/aliases.sh

# RBENV
eval "$(rbenv init - zsh)"

# NVM
if [ -d ~/.nvm ]
then
  source ~/.nvm/nvm.sh
fi

# TIG
export GIT_PAGER="tig"
