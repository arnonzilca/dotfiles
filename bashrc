# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

function set_prompt {
    local GREEN_B="\[\033[1;32m\]"
    local RED_B="\[\033[1;31m\]"
    local BLUE_B="\[\033[1;34m\]"
    local PURPLE_B="\[\033[1;35m\]"
    local CYAN_B="\[\033[1;36m\]"
    local NONE="\[\033[0m\]"

    local USER_COLOR=$([[ $(whoami) == "root" ]] && echo "${RED_B}" || echo "${GREEN_B}")
    local PROMPT_CHAR=$([[ $(whoami) == "root" ]] && echo '#' || echo '$')

    if [[ -r /etc/debian_chroot ]]; then
        local debian_chroot=$(cat /etc/debian_chroot)
    fi

    if [[ -r /etc/bash_completion.d/git ]]; then
        source /etc/bash_completion.d/git
        git_cmd='$(__git_ps1)'
    fi

    if [[ -r /etc/bash_completion.d/git-prompt ]]; then
        source /etc/bash_completion.d/git-prompt
        git_cmd='$(__git_ps1)'
    fi

    local PS1_HEAD="${CYAN_B}${debian_chroot:+($debian_chroot) }${USER_COLOR}\u@\h${NONE}:${BLUE_B}\w"
    local PS1_FOOT="${PROMPT_CHAR}${PURPLE_B}${git_cmd} ${NONE}"
    local PS1_RETURN_COLOR='$([[ $? = 0 ]] && echo "\[\033[0m\]" || echo "\[\033[0;31m\]")'
    export PS1="${PS1_HEAD}${PS1_RETURN_COLOR}${PS1_FOOT}"
}

set_prompt

export PATH=$HOME/bin:$HOME/scripts:$PATH

export EDITOR=vim

HISTSIZE=1000
HISTFILESIZE=2000

#stty -ixon # disable C-s C-q scroll lock

source $HOME/.bash_aliases
source $HOME/.bash_functions

if [[ -r $HOME/local_dotfiles/.bashrc ]]; then
    source $HOME/local_dotfiles/.bashrc
fi
