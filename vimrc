
if has('vim_starting')
	set nocompatible               " Be iMproved
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'bling/vim-airline'

filetype plugin indent on

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

let local_vimrc = $HOME
let local_vimrc .= '/local_dotfiles/.vimrc'
if filereadable(local_vimrc)
	source ~/local_dotfiles/.vimrc
endif

NeoBundleCheck
