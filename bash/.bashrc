#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Shell Variables
PS1="\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;36m\]\W\[\e[0m\] \\$ "
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:/usr/local/texlive/2023/bin/x86_64-linux

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
