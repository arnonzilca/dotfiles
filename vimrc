let local_vimrc = $HOME
let local_vimrc .= '/local_dotfiles/.vimrc'
if filereadable(local_vimrc)
	source ~/local_dotfiles/.vimrc
endif

syntax on
set smartindent
set hlsearch
set incsearch

set tabstop=4
set shiftwidth=4
set softtabstop=4

set ic

au FileType cpp set si sw=4 ts=4 sts=4 et cindent
au FileType sh set si sw=4 ts=4 sts=4 et
