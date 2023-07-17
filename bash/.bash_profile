#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    # Start wayland compositor
    exec starthl
fi
