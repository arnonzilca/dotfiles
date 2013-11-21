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
NeoBundle 'kien/ctrlp.vim'

"set 256 colors
set t_Co=256

"enlarge status bar for airline
set laststatus=2

"set eclim options
let g:EclimCompletionMethod = 'omnifunc'

" set highlights
highlight Pmenu ctermbg=247 ctermfg=17
highlight PmenuSel ctermfg=7 ctermbg=4
highlight Search cterm=NONE ctermfg=black ctermbg=33
highlight Normal ctermfg=250 ctermbg=233

" set PT command to call PT(...) with or without arguments
command! -nargs=* PT call PT(<f-args>)

" function PT will open eclim's ProjectTree
" when run with no arguments the function will call 'ProjectTree .'
" when run with arg1 the function will call 'ProjectTree arg1'
function PT(...)
    if a:0 > 0
        let s:project_folder = a:1
    exec 'ProjectTree '.s:project_folder
    else
        ProjectTree .
    endif
endfunction

" if eclim is installed & current folder has an .eclimrc & no files were to
" vim then open eclim's ProjectTree (using PT)
autocmd VimEnter * if exists(":PingEclim") && filereadable(".eclimrc") && argc() == 0 | :call PT() | endif


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
