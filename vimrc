if has('vim_starting')
    set nocompatible               " Be iMproved
    :exe ":set runtimepath+=$HOME/.vim/bundle/neobundle.vim/"
endif

call neobundle#rc(expand("$HOME/.vim/bundle/"))

" Let NeoBundle manage plugins (including itself)
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'uarun/vim-protobuf'
NeoBundle 'fatih/vim-go'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-scripts/a.vim'
NeoBundle 'bogado/file-line'
NeoBundle 'solarnz/thrift.vim'
NeoBundle 'tpope/vim-pathogen'
"NeoBundle 'elzr/vim-json'
"NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'vim-scripts/Mark'
NeoBundle 'vim-scripts/Align'
NeoBundle 'ekalinin/Dockerfile.vim'

" mouse support
set mouse=a

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

" set normal view highlight colors
highlight Pmenu         cterm=none  ctermbg=247 ctermfg=17
highlight PmenuSel      cterm=none  ctermbg=4   ctermfg=7
highlight Search        cterm=none  ctermbg=33  ctermfg=black
highlight Normal        cterm=none  ctermbg=232 ctermfg=250
highlight Visual        cterm=none  ctermbg=111 ctermfg=17

" set diff view highlight colors
"highlight DiffAdd       cterm=none  ctermbg=18
"highlight DiffDelete    cterm=none  ctermbg=235
"highlight DiffChange    cterm=none  ctermbg=53
"highlight DiffText      cterm=none  ctermbg=238
highlight DiffAdd       cterm=none  ctermbg=22
highlight DiffDelete    cterm=none  ctermbg=52
highlight DiffChange    cterm=none  ctermbg=235
highlight DiffText      cterm=none  ctermbg=58

" set spell check highlight color
highlight clear SpellBad
highlight SpellBad cterm=underline ctermfg=9

" highlight unwated white spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" define & highlight max text width
set textwidth=100
if version >= 704
    set colorcolumn=100
    highlight ColorColumn ctermbg=black
endif

" fix backspace behaviour
set backspace=2

" auto save + warning when multichanging a file.
set autoread autowrite

" hitting // when a text is selcted will search the slected text
vnoremap // y/<C-R>"<CR>

" since C-A is used for tmux, use C-I to increment numbers
noremap <C-I> <C-A>

" set F5 to full size window
map <F5> :50winc + <CR>

" redundant - just a reminder that can be overwrited in local_dotfiles
set makeprg=make
" set F6 to compilation (makeprg is set in local_dotfiles)
map <F6> :make <CR>

" creating Run command for overloading
command! Run execute "echoerr 'Run command is not set. please overwrite it in ~/local_dotfiles/.vimrc or in your current directory.'"
" set F7 to run tests
map <F7> :Run <CR>

command! CompileAndRun execute "make" | execute "Run"
" set F8 to compile & run tests
map <F8> :CompileAndRun <CR>

" creating CheckOutFile command for overloading
command! CheckOutFile execute "echoerr 'CheckOutFile command is not set. please overwrite it in ~/local_dotfiles/.vimrc or in your current directory.'"
" set F9 to check out a file
map <F9> :CheckOutFile <CR>

" creating RevertCheckOut command for overloading
command! RevertCheckOut execute "echoerr 'RevertCheckOut command is not set. please overwrite it in ~/local_dotfiles/.vimrc or in your current directory.'"
" set F10 to revert checking out a file
map <F10> :RevertCheckOut <CR>

" set F12 and F11 to cn and cp (next/previous markup)
map <F12> :cn <CR>
map <F11> :cp <CR>

" set W to write like w
command! W w

" set Nowrap to stop physical line wrapping
command! Nowrap set textwidth=0 wrapmargin=0

" set PT command to call PT(...) with or without arguments
command! -nargs=* PT call PT(<f-args>)

" function PT will open eclim's ProjectTree
" when run with no arguments the function will call 'ProjectTree .'
" when run with arg1 the function will call 'ProjectTree arg1'
function! PT(...)
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

filetype on
filetype plugin indent on
autocmd Filetype json setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

syntax on
set autoindent
set hlsearch
set incsearch

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set backupcopy=yes

" set ignore case
set ic

if has('gui_running')
    colorscheme darkblue
    set guifont=Monospace\ 13
    " Maximize gvim window.
    au GUIEnter * simalt ~x
endif

" Markdown
au BufNewFile,BufRead *.md set filetype=markdown

" set spacing & indent
au FileType cpp set si sw=4 ts=4 sts=4 et cindent
au FileType sh set si sw=4 ts=4 sts=4 et

" source file if exists
function! SourceFile(file)
    if filereadable(a:file)
        execute 'source' a:file
    endif
endfunction

" source ~/local_dotfiles/.vimrc (if exists).
call SourceFile($HOME."/local_dotfiles/.vimrc")

if $PWD != $HOME
    " source the local directory's .vimrc unless local directory is HOME (and if exists).
    call SourceFile('.vimrc')
endif

set path+=include

NeoBundleCheck
