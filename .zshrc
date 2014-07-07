export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="simple"
export DISABLE_AUTO_UPDATE=true

plugins=(git history-substring-search ruby rbenv redis-cli)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all

export PATH=$HOME/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/.node/bin:$HOME/local/node/bin:$PATH
export NODE_PATH=$HOME/local/node:$HOME/local/node/lib/node_modules

export SVN_EDITOR=vi
export PAGER=vimpager
export EDITOR='mvim -f'

source ~/.dotfiles/aliases.sh

eval "$(rbenv init - zsh)"

# FIX https://github.com/robbyrussell/oh-my-zsh/pull/1355
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down
