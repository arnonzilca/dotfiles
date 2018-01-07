# .bash_profile

# Get the aliases and functions
if [ -f $HOME/.bashrc ]; then
	. $HOME/.bashrc
fi

if [[ -a $HOME/local_dotfiles/.bash_profile ]]; then
    source $HOME/local_dotfiles/.bash_profile
fi

source ~/.git-prompt.sh

# User specific environment and startup programs
