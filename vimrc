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
set nowrap

" allow vim to put buffers on the background without writing to disk and
" remember history and marks when buffer becomes current
set hidden

" shows file title when editing 
set title

" fold settings
set foldmethod=syntax
set foldlevelstart=2
set foldnestmax=3

set number
set history=100       " Save the last 100 commands/search terms
set laststatus=2      " Always display the status line

" search settings
set hlsearch
set ignorecase        " Ignore case in searches.
set smartcase         " Case sensitive if capitals are included.

set autoread          " automatically reload a file if it's changed outside vim

set backspace=indent,eol,start " backspace deletes back 

" Use Ag instead of Grep when available
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Automatically include quotes, because they never hurt and forgetting them is a pain.
  " Use <Leader>a to prompt you for an Ag search
  nnoremap <Leader>a :Ag!<SPACE>"<LEFT>"

  " Use <Leader>A to ag for the word under the cursor
  nnoremap <leader>A *<C-O>:AgFromSearch!<CR>
else
  " Use Ack instead of Grep when available
  if executable("ack")
    set grepprg=ack\ -H\ --nogroup\ --nocolor

    " Automatically include quotes, because they never hurt and forgetting them is a pain.
    " Use <Leader>a to prompt you for an Ack search
    nnoremap <Leader>a :Ack!<SPACE>"<LEFT>"

    " Use <Leader>A to Ack for the word under the cursor
    nnoremap <leader>A *<C-O>:AckFromSearch!<CR>
  endif
endif

set tags=./tags;       " TagList

set gfn=Inconsolata:h14

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
Bundle 'epmatsw/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle "mileszs/ack.vim"
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdtree'
Bundle 'Raimondi/delimitMate'
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

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

" Yankstack configuration
let g:yankstack_map_keys = 0
nmap <leader>v <Plug>yankstack_substitute_older_paste
nmap <leader>V <Plug>yankstack_substitute_newer_paste

" Available colorschemes
" colorscheme desert-warm-256 
" colorscheme github
colorscheme molokai 
" colorscheme zenburn

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
map <Leader>t :NERDTreeToggle<CR>
nnoremap <F1> :NERDTreeFind<CR>

" Generate ctags 
map <leader>ct :!ctags --extra=+f --languages=-javascript --exclude=.git --exclude=log -R .<CR>

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %
