set nocompatible

augroup HighlightTrailingSpaces
	autocmd!
	autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
	autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" turn on syntax highlighting
syntax on

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin indent on

" reload files changed outside vim
set autoread

" search settings
set incsearch        " find the next match as we type the search
set hlsearch         " hilight searches by default

" indentation
set autoindent
set smartindent

set ruler
set number

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

set noswapfile

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" enable omni completion
set omnifunc=syntaxcomplete#Complete

" ---------------------- PLUGIN CONFIGURATION ----------------------
source ~/.vim/vimrcs/vundle.vim

set background=dark
colorscheme solarized
