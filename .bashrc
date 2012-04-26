# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
PS1='[\u@\h \w ]$ '

alias ls='ls -G --color=auto'

# history handling
#
# Erase duplicates
export HISTCONTROL=erasedups
# resize history size
export HISTSIZE=5000
# append to bash_history if Terminal.app quits
shopt -s histappend
