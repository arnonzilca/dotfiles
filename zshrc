# .zshrc

# Source global definitions
if [ -f /etc/zshrc ]; then
    . /etc/zshrc
fi

function set_prompt() {
    # Load version control information
    autoload -Uz vcs_info
    precmd_vcs_info() { vcs_info }
    precmd_functions+=( precmd_vcs_info )

    # Format the vcs_info_msg_0_ variable
    zstyle ':vcs_info:git:*' formats ' (%b)'

    setopt prompt_subst
    export PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%F{magenta}${vcs_info_msg_0_}%f %% '
    RPROMPT="%D{%y/%m/%f}|%@"
}

set_prompt

export PATH=$HOME/bin:$HOME/scripts:/opt/homebrew/bin:$PATH

export EDITOR=vim

HISTSIZE=1000
HISTFILESIZE=2000

#stty -ixon # disable C-s C-q scroll lock

source $HOME/.aliases

if [[ -r $HOME/local_dotfiles/.zshrc ]]; then
    source $HOME/local_dotfiles/.zshrc
fi

