# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [[ -a ~/local_dotfiles/.bash_profile ]]; then
    source ~/local_dotfiles/.bash_profile
fi

# User specific environment and startup programs
