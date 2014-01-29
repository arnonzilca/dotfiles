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
NeoBundle 'jnwhiteh/vim-golang'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-scripts/a.vim'

" set 256 colors
set t_Co=256

" enlarge status bar for airline
set laststatus=2

" set scroll margins
set scrolloff=7

" Don't go into Ex land
nnoremap Q <nop>

" set eclim options
let g:EclimCompletionMethod = 'omnifunc'

" set highlights
highlight Pmenu         cterm=none  ctermbg=247 ctermfg=17
highlight PmenuSel      cterm=none  ctermbg=4   ctermfg=7
highlight Search        cterm=none  ctermbg=33  ctermfg=black
highlight Normal        cterm=none  ctermbg=232 ctermfg=250
highlight Visual        cterm=none  ctermbg=111 ctermfg=17
highlight DiffAdd       cterm=none  ctermbg=17
highlight DiffDelete    cterm=none  ctermbg=235
highlight DiffChange    cterm=none  ctermbg=53
highlight DiffText      cterm=none  ctermbg=52

" highlight unwated white spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" auto save + warning when multichanging a file.
set autoread autowrite

" set F5 to full size window
map <F5> :50winc + <CR>

" redundant - just a reminder that can be overwrited in local_dotfiles
set makeprg=make
" set F6 to compilation (makeprg is set in local_dotfiles)
map <F6> :make <CR>

" creating RunTests command for overloading in local_dotfiles
command RunTests execute "echoerr 'RunTests command is not set. please overwrite it in ~/local_dotfiles/.vimrc'"
" set F7 to run tests
map <F7> :RunTests <CR>

command CompileAndRun execute "make" | execute "RunTests"
" set F8 to compile & run tests
map <F8> :CompileAndRun <CR>

" creating CheckOutFile command for overloading in local_dotfiles
command CheckOutFile execute "echoerr 'CheckOutFile command is not set. please overwrite it in ~/local_dotfiles/.vimrc'"
" set F9 to check out a file
map <F9> :CheckOutFile <CR>

" creating RevertCheckOut command for overloading in local_dotfiles
command RevertCheckOut execute "echoerr 'RevertCheckOut command is not set. please overwrite it in ~/local_dotfiles/.vimrc'"
" set F10 to revert checking out a file
map <F10> :RevertCheckOut <CR>

" set F12 and F11 to cn and cp (next/previous markup)
map <F12> :cn <CR>
map <F11> :cp <CR>

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

" adding command alias 'T' for tab opening
cnoreabbrev <expr> T ((getcmdtype() is# ':' && getcmdline() is# 'T')?('tabedit'):('T'))

filetype plugin indent on

syntax on
set autoindent
set hlsearch
set incsearch

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" set ignore case
set ic

if has('gui_running')
    colorscheme darkblue
    set guifont=Monospace\ 13
    " Maximize gvim window.
    au GUIEnter * simalt ~x
endif

" set spacing & indent
au FileType cpp set si sw=4 ts=4 sts=4 et cindent
au FileType sh set si sw=4 ts=4 sts=4 et

" source file if exists
function SourceFile(file)
    if filereadable(a:file)
        execute 'source' a:file
    endif
endfunction

" source ~/local_dotfiles/.vimrc if exists.
call SourceFile($HOME."/local_dotfiles/.vimrc")

" source the local directory's .vimrc if exists.
call SourceFile('.vimrc')

NeoBundleCheck
