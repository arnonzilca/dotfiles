#!/bin/bash

function tmux() {
    if [[ $# == 0 ]]; then
        TERM="xterm-256color" command tmux attach || tmux new
    else
        TERM="xterm-256color" command tmux $*
    fi
}

function tmup() {
    echo -n "Updating to latest tmux environment...";
    export IFS=",";
    for line in $(tmux showenv -t $(tmux display -p "#S") | tr "\n" ",");
    do
        if [[ $line == -* ]]; then
            unset $(echo $line | cut -c2-);
        else
            export $line;
        fi;
    done;
    unset IFS;
    echo "Done"
}

function tmux-run-everywhere() {
    tmux list-windows -t 0 | cut -d: -f1 | xargs -I{} tmux send-keys -t 0:{} "$1" Enter
}
