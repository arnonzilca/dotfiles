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
alias l='ls -lqh'
alias ll='ls -laqh'
alias grep='grep --color'
alias gnr='grep -Inr'
alias gnir='grep -Inir'
alias vimgnr='vimgrep -r'
alias vimgnir='vimgrep -ir'
alias v='vim'
alias sv='vim -c AS'
alias vd='vimdiff'
alias remount='sudo umount -a -t cifs -l && sudo mount -a'
alias remake='make clean all'
alias alert="zenity --info --text='Done!'"
alias tmux-alert='tmux display-message "Done!"'
alias eclimd='$ECLIPSE_HOME/eclimd'
alias car='echo "Vroom Vroom!" && read -n 1 c && cat'
alias tag='[[ -f tags-descriptor ]] && ctags -R $(cat tags-descriptor) || echo "no tags-descriptor file"'
alias bashrc-tmux-source='tmux-run-everywhere "source ~/.bashrc"'
alias gd='git diff'
alias gdc='git diff --cached'
alias gis='git status'
alias gfr='git fetch-rebase'
alias gg='git graph'
alias ggg='git full-graph'
alias myip="curl http://bot.whatismyipaddress.com/ && echo"
alias has-null="python -c 'import sys; sys.exit(not b\"\x00\" in open(sys.argv[1], \"rb\").read())'"
alias histogram="sort | uniq -c | sort -nr"
alias sum="awk '{s+=\$1} END {print s}'"
alias average="awk '{ s += \$1; c++ } END { print s/c }'"
alias median="sort | awk ' { a[i++]=$1; } END { print a[int(i/2)]; }'"
alias subtract_sorted="comm -23"
alias errcho='>&2 echo'
alias space='du -sh * | sort -h'

# change directory
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

if [[ -a $HOME/local_dotfiles/.bash_aliases ]]; then
    source $HOME/local_dotfiles/.bash_aliases
fi
