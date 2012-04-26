# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

HISTFILESIZE=1000000000
HISTSIZE=1000000
export HISTCONTROL=ignoredups

# User specific environment and startup programs

PATH=/usr/local/sbin:/usr/local/bin:$PATH:$HOME/bin

export PATH
