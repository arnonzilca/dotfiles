#!/bin/bash
# part of the .bashrc

if [[ -a ~/local_dotfiles/.bash_aliases ]]; then
    source ~/local_dotfiles/.bash_aliases
fi

alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -la'
alias grep='grep --color'
alias gnr='grep -Inr'
alias gnir='grep -Inir'
alias v='vim'
alias remount='sudo umount -a -t cifs -l && sudo mount -a'
alias remake='make clean && make'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alerts//'\'')"'
alias eclimd='$ECLIPSE_HOME/eclimd'
