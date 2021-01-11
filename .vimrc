set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Keep Plugin commands between vundle#begin/end.

" Autocompletion
"Plugin 'Valloric/YouCompleteMe'
Plugin 'ackyshake/VimCompletesMe'

" Commenting blocks of code
Plugin 'scrooloose/nerdcommenter'

" Syntax and Semantics checking
" Previously had syntastic
"Plugin 'vim-syntastic/syntastic'
"Plugin 'w0rp/ale'
Plugin 'dense-analysis/ale'
" TODO try vim-polyglot

" Powerline status line
"Plugin 'powerline/powerline'
"Plugin 'powerline/powerline-fonts'
"Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/lightline.vim'

" Better searching
Plugin 'ctrlpvim/ctrlp.vim'
"TODO install fzf. But simple vundle installation is not enough

" Autopep8 formatting for python. Now included in ALE
"Plugin 'tell-k/vim-autopep8'

" Insert or delete brackets, quotes in pairs
Plugin 'jiangmiao/auto-pairs'

" Emojis in vim
Plugin 'https://gitlab.com/gi1242/vim-emoji-ab/'

" Generate python docstrings
Plugin 'heavenshell/vim-pydocstring'

" Count search matches
Plugin 'google/vim-searchindex'

" Predefined code snippets
" TODO configure this
"Plugin 'SirVer/ultisnips'

" Color schemes
Plugin 'joshdick/onedark.vim'
Plugin 'dsolstad/vim-wombat256i'

" Markdown Preview
Plugin 'iamcco/markdown-preview.nvim'

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


"### Plugin settings ###"

""" ALE """
"let g:ale_linters = {
    "\   'python': ['flake8', 'pylint'],
"\}
let g:ale_fixers = {
    \   'python': ['autopep8'],
\}
let g:ale_python_autopep8_options = '--aggressive' 
let g:ale_fix_on_save = 1


""" YouCompleteMe """
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

""" Syntastic """
"let python_highlight_all=1

""" Ctrlp """
let g:ctrlp_working_path_mode = 'ra'

"""" Autopep8 """
"let g:autopep8_on_save = 1
"let g:autopep8_disable_show_diff=1

""" Emoji-ab """
au FileType html,php,markdown,mmd,text,mail,gitcommit
    \ runtime macros/emoji-ab.vim

""" Pydocstring """
"let g:pydocstring_doq_path = '$HOME/miniconda3/bin/doq'
"let g:pydocstring_doq_path = '/usr/local/Caskroom/miniconda/base/bin/doq'
let g:pydocstring_doq_path = '$CONDA_PREFIX/bin/doq'
let g:pydocstring_formatter = 'google'

""" Ultisnips """
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"### Custom stuff ###"

colorscheme wombat256i
inoremap jk <ESC>
let mapleader = "\<Space>"
filetype plugin indent on
syntax on
set encoding=utf-8
" Spell-checking for certain file types only
augroup textSpell
    autocmd!
    autocmd FileType text setlocal spell spelllang=en_us
    autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
augroup END
augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell spelllang=en_us
    autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
augroup END

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
set clipboard=unnamed,unnamedplus

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

" Add new line below without entering insert mode
nnoremap <CR> o<Esc>k

" Split line on cursor
nnoremap K i<CR><Esc>

" move with j and k in autocomplete list
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" Folding, in python
au BufNewFile,BufRead *.py
    \ set foldmethod=indent
nnoremap <space> za
set foldlevel=99
