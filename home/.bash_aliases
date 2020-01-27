if [ -x /usr/games/cowsay -a -x /usr/games/fortune ]; then
    fortune | cowsay
fi
# disable terminal freeze when clicking Ctrl-s
stty -ixon

alias targz_extract="tar -xvf"
alias vi=vim
alias vim="stty stop '' -ixoff; vim"

# run gdb until program bombs & print stack trace
alias gdb_trace="gdb --batch --ex r --ex bt --ex q --args"
alias lsblk="lsblk -o name,mountpoint,label,size,uuid"

# make an environment variable for my cscope db
export CSCOPE_SRC=~/.cscope
export CSCOPE_EDITOR=vim

#if [[ ! $TERM =~ screen ]]; then
#    exec tmux
#fi



