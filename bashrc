# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

tmup ()
{
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

function set_prompt {
    local BLACK="\[\033[0;30m\]"
    local BLACKBOLD="\[\033[1;30m\]"
    local RED="\[\033[0;31m\]"
    local REDBOLD="\[\033[1;31m\]"
    local GREEN="\[\033[0;32m\]"
    local GREENBOLD="\[\033[1;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local YELLOWBOLD="\[\033[1;33m\]"
    local BLUE="\[\033[0;34m\]"
    local BLUEBOLD="\[\033[1;34m\]"
    local PURPLE="\[\033[0;35m\]"
    local PURPLEBOLD="\[\033[1;35m\]"
    local CYAN="\[\033[0;36m\]"
    local CYANBOLD="\[\033[1;36m\]"
    local WHITE="\[\033[0;37m\]"
    local WHITEBOLD="\[\033[1;37m\]"
    local NONE="\[\033[0m\]"

    local PS1_HEAD="${CYAN}${debian_chroot:+($debian_chroot) }${GREEN}\u@\h${NONE}:${BLUE}\w"
    local PS1_FOOT="$ ${NONE}"
    local PS1_RETURN_COLOR='$([[ $? = 0 ]] && echo "\[\033[0m\]" || echo "\[\033[0;31m\]")'
    export PS1="${PS1_HEAD}${PS1_RETURN_COLOR}${PS1_FOOT}" 
}

function tmux {
    if [[ $# == 0 ]]; then
        command tmux attach || tmux new
    else
        command tmux $*
    fi
}

export PATH=$HOME/bin:$HOME/scripts:$PATH

HISTSIZE=1000
HISTFILESIZE=2000

source ~/.bash_aliases

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

set_prompt

if [[ -a ~/local_dotfiles/.bashrc ]]; then
    source ~/local_dotfiles/.bashrc
fi
