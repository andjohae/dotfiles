# .bashrc

##################################################
# General settings
##################################################

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Added by Anaconda3 4.3.0 installer
export PATH="/home/ajohansson/anaconda3/bin:$PATH"


##################################################
# Prompt
##################################################

# Function for getting name of current git branch
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

# TODO: Sort out how to add git branch name to prompt


##################################################
# User specific aliases and functions
##################################################

# Some convieniet 'ls' aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -1X'

# Get week number
alias week='date +"%V"'

# Config alias for git tracking of dotfiles
alias config='/usr/bin/git --git-dir=/home/ajohansson/.cfg/ --work-tree=/home/ajohansson'
