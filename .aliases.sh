
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
