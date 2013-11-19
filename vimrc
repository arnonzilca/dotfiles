if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage plugins (including itself)
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'uarun/vim-protobuf'
"NeoBundle 'ervandew/supertab'

set t_Co=256
set laststatus=2
"let g:EclimProjectTreeAutoOpen = 1

filetype plugin indent on

syntax on
set smartindent
set hlsearch
set incsearch

set tabstop=4
set shiftwidth=4
set softtabstop=4

set ic

"set gui font
if has('gui_running')
  set guifont=Monospace\ 12
endif

" set spacing & indent
au FileType cpp set si sw=4 ts=4 sts=4 et cindent
au FileType sh set si sw=4 ts=4 sts=4 et

" include ~/local_dotfiles/.vimrc if exists.
let local_vimrc = $HOME
let local_vimrc .= '/local_dotfiles/.vimrc'
if filereadable(local_vimrc)
	source ~/local_dotfiles/.vimrc
endif

NeoBundleCheck
