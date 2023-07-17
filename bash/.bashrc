#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Shell Variables
NONE='\[\e[0m\]'
BLACK='\[\e[0;30m\]'
RED='\[\e[0;31m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[0;33m\]'
BLUE='\[\e[0;34m\]'
PURPLE='\[\e[0;35m\]'
CYAN='\[\e[0;36m\]'
GREY='\[\e[0;37m\]'
BBLACK='\[\e[1;30m\]'
BRED='\[\e[1;31m\]'
BGREEN='\[\e[1;32m\]'
BYELLOW='\[\e[1;33m\]'
BBLUE='\[\e[1;34m\]'
BPURPLE='\[\e[1;35m\]'
BCYAN='\[\e[1;36m\]'
BGREY='\[\e[1;37m\]'
BGBLACK='\[\e[40m\]'
BGRED='\[\e[41m\]'
BGGREEN='\[\e[42m\]'
BGYELLOW='\[\e[43m\]'
BGBLUE='\[\e[44m\]'
BGPURPLE='\[\e[45m\]'
BGCYAN='\[\e[46m\]'
BGGREY='\[\e[47m\]'

PS1="$GREEN\u@\h$NONE:$CYAN\W$NONE \\$ "
PATH=$PATH:~/.local/bin

# Aliases
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -al'
alias ra='ranger'
alias rm='rm -Iv --preserve-root'
alias tree='tree -C'

# Functions
yay() {
    command yay "$@"
    eww update aur=$($HOME/.config/eww/scripts/aur)
    eww update pacman=$($HOME/.config/eww/scripts/pacman)
}
