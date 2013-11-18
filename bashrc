# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH=$HOME/bin:$HOME/scripts:$PATH

HISTSIZE=1000
HISTFILESIZE=2000

source ~/.bash_aliases

PS1='$([ $? = 0 ] && X=7 || X=1;
        tput setaf 2;   echo -n "\u@\h";
        tput setaf 4;   echo -n :$(sed "s|$HOME|~|g" <<< $PWD);
        tput setaf $X;  echo -n "$ ";
        tput sgr0)'

if [[ -a ~/local_dotfiles/.bashrc ]]; then
    source ~/local_dotfiles/.bashrc
fi
