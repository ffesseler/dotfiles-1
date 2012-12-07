# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="simple"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
unsetopt correct_all

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

export PATH=$HOME/local/node/bin:$PATH
export NODE_PATH=$HOME/local/node:$HOME/local/node/lib/node_modules
export SVNROOT=https://svn.semantico.net/repos/main/
export SVN_EDITOR=vi
export PAGER=vimpager
export EDITOR=mvim
alias less=$PAGER
alias zless=$PAGER
alias qm="mvn -DskipTests -DskipITs -Dmaven.test.skip"
alias tmux="TERM=screen-256color-bce tmux"

pull-mvn () {
    PULL=$(git pull)
    if [ $PULL != "Already up-to-date." ]
        then
            qm
    fi
}

sipp2 () {
    PWD=$(pwd)
    cd ~/src/sipp2/sipp2-parent
    pull-mvn
    cd ~/src/sipp2/sipp2-core
    pull-mvn
    cd $PWD
}

[ -s "/Users/dans/.scm_breeze/scm_breeze.sh" ] && source "/Users/dans/.scm_breeze/scm_breeze.sh"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/1.7.0.jdk/Contents/Home

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

$DISABLE_AUTO_UPDATE = true
