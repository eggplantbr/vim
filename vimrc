" Leader key
let mapleader = ","

set nocompatible      " Be iMproved
set nobackup
set nowritebackup
set noswapfile
set incsearch         " Enable incremental searching
set expandtab
set tabstop=2 
set shiftwidth=2 
set softtabstop=2
set autoindent

set number
set history=100       " Save the last 100 commands/search terms
set laststatus=2      " Always display the status line

set hlsearch
set ignorecase        " Ignore case in searches.
set smartcase         " Case sensitive if capitals are included.

set autoread          " automatically reload a file if it's changed outside vim

set backspace=indent,eol,start " backspace deletes back 

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

set tags=./tags;       " TagList

set gfn=Inconsolata:h16

" check to make sure vim has been compiled with colorcolumn support before enabling it
if exists("+colorcolumn")
  set colorcolumn=120
endif

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Original repos on github
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle "mileszs/ack.vim"
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/tComment'

" Colorschemes
Bundle 'croaky/vim-colors-github'
Bundle 'desert-warm-256'
Bundle 'jnurmine/Zenburn'
Bundle 'tomasr/molokai'

filetype plugin indent on     " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" CtrlP configuration
let g:ctrlp_map = '<Leader>f' 

" Vim gutter configuration
let g:gitgutter_enabled = 1

" Powerline configuration
let g:Powerline_symbols = "fancy"

" Available colorschemes
" colorscheme desert-warm-256 
" colorscheme github
colorscheme molokai 
" colorscheme zenburn

" Use <Leader>a to prompt you for an Ack search
" Automatically include quotes, because they never hurt and forgetting them is a pain.
nnoremap <Leader>a :Ack!<SPACE>"<LEFT>"

" Use <Leader>A to ack for the word under the cursor
nnoremap <leader>A *<C-O>:AckFromSearch!<CR>

" Go learn vim 
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Automatically change to the current directory
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Turn search highlight off
nnoremap <leader><space> :noh<cr>

" Gundo default key
nnoremap <F5> :GundoToggle<CR>

" Navigate in buffers.
map <Leader>n :bnext<CR>
map <Leader>p :bprevious<CR>

" Navigate in splits.
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" use C-j and C-k to 'bubble' lines (see
" " http://vimcasts.org/episodes/bubbling-text/)
map <C-j> ddp
map <C-k> ddkP

" NerdTree
map <C-n> :NERDTreeToggle<CR>
nnoremap <F1> :NERDTreeFind<CR>

" Generate ctags 
map <leader>ct :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R .<CR>

