set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" BenGal personal plugins:

" Autocompletion
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ajh17/VimCompletesMe'

" Commenting blocks of code
Plugin 'scrooloose/nerdcommenter'

" Syntax Checking
Plugin 'vim-syntastic/syntastic'
"Plugin 'w0rp/ale'

" Powerline status line
"Plugin 'powerline/powerline'
"Plugin 'powerline/powerline-fonts'
"Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/lightline.vim'

" Better searching
Plugin 'ctrlpvim/ctrlp.vim'
"TODO install fzf. But simple vundle installation is not enough

" Autopep8 formatting for python
Plugin 'tell-k/vim-autopep8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

inoremap jk <ESC>
let mapleader = "\<Space>"
filetype plugin indent on
syntax on
set encoding=utf-8
" Spell-checking for code is annoying
" set spell spelllang=en_us

" Tab sizes
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" Display line numbers
set number
set relativenumber
set ruler
" Searching
set hlsearch
set ignorecase
set smartcase
set incsearch
" Using the mouse for scrolling, but then the terminal can not use the mouse
" any more
" set mouse=a
" don't use the arrow keys any more
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
"naturally using hjkl
nnoremap j gj
nnoremap k gk
" use ; as :. Pressing shift is annoying
nnoremap ; :
" don't continue single line comments //"
au FileType c,cpp setlocal comments-=:// comments+=f://
" when pasting comments, disable autoindent with F10
nnoremap <F10> :set invpaste paste?<CR>
set pastetoggle=<F10>
set showmode
" netrw settings
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
augroup ProjectDrawer
	autocmd!
	autocmd VimEnter * :Vexplore
	autocmd VimEnter * wincmd l 
augroup END
"easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" use the system clipboard
set clipboard=unnamed

" enable persistent history, save undo files in .vim directory
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

"problems with backspace in vi 8.0"
set backspace=indent,eol,start

" Settings for YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" For python syntax checking with syntastic
let python_highlight_all=1

" Ctrlp options
let g:ctrlp_working_path_mode = 'ra'

" Automatically format to PEP 8 style every time saving a python file
let g:autopep8_on_save = 1
let g:autopep8_disable_show_diff=1
