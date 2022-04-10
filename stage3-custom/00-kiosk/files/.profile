# ~/.profile: executed by the command interpreter for login shells.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

PS1='[\[\e[0;32m\]\u@\h \[\e[0;34m\]\W\[\e[0;00m\]]\$ ';

alias ll='ls -lhF'
alias la='ls -AF'
alias l='ls -CF'
alias s='sudo'
alias sus='sudo -s'



[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx > /dev/null 2>&1
