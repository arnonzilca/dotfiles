#!/bin/bash
# part of the .bashrc

vimgrep() {
    cmd=""
    for arg in "$@"; do
        cmd="${cmd} \"${arg}\""
    done
    vim -c "grep ${cmd}"
}

alias ls='ls --color=auto'
alias l='ls -lq'
alias ll='ls -laq'
alias grep='grep --color'
alias gnr='grep -Inr'
alias gnir='grep -Inir'
alias vimgnr='vimgrep -r'
alias vimgnir='vimgrep -ir'
alias v='vim'
alias sv='vim -c AS'
alias vd='vimdiff'
alias remount='sudo umount -a -t cifs -l && sudo mount -a'
alias remake='make clean && make'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alerts//'\'')"'
alias tmux-alert='tmux display-message "Done!"'
alias eclimd='$ECLIPSE_HOME/eclimd'
alias car='echo "Vroom Vroom!" && read -n 1 c && cat'
alias gd='git diff'
alias gg='git graph'
alias ggg='git full-graph'

# change directory
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

if [[ -a ~/local_dotfiles/.bash_aliases ]]; then
    source ~/local_dotfiles/.bash_aliases
fi
