# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function set_prompt {
    local GREEN="\[\033[0;32m\]"
    local BLUE="\[\033[0;34m\]"
    local PURPLEBOLD="\[\033[1;35m\]"
    local PURPLE="\[\033[0;35m\]"
    local CYAN="\[\033[0;36m\]"
    local NONE="\[\033[0m\]"

    if [[ -r /etc/debian_chroot ]]; then
        local debian_chroot=$(cat /etc/debian_chroot)
    fi

    if [[ -r /etc/bash_completion.d/git ]]; then
        source /etc/bash_completion.d/git
        git_cmd='$(__git_ps1)'
    fi

    local PS1_HEAD="${CYAN}${debian_chroot:+($debian_chroot) }${GREEN}\u@\h${NONE}:${BLUE}\w"
    local PS1_FOOT="\$${PURPLEBOLD}${git_cmd} ${NONE}"
    local PS1_RETURN_COLOR='$([[ $? = 0 ]] && echo "\[\033[0m\]" || echo "\[\033[0;31m\]")'
    export PS1="${PS1_HEAD}${PS1_RETURN_COLOR}${PS1_FOOT}"
}

set_prompt

export PATH=$HOME/bin:$HOME/scripts:$PATH

HISTSIZE=1000
HISTFILESIZE=2000

source ~/.bash_aliases
source ~/.bash_functions

if [[ -r ~/local_dotfiles/.bashrc ]]; then
    source ~/local_dotfiles/.bashrc
fi
