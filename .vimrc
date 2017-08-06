set nocompatible

augroup HighlightTrailingSpaces
	autocmd!
	autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
	autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

syntax on
filetype on
filetype plugin indent on

set autoread
set incsearch
set hlsearch
set autoindent
set ruler
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
" ---------------------- PLUGIN CONFIGURATION ----------------------
let &runtimepath.=',$HOME/.vim/bundle/Vundle.vim'
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" -- Web Development
Plugin 'altercation/vim-colors-solarized'
Plugin 'Shutnik/jshint2.vim'
Plugin 'tpope/vim-rails'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'skammer/vim-css-color'
call vundle#end()

" run JSHint when a file with .js extension is saved
autocmd BufWritePost *.js silent :JSHint

set background=dark
colorscheme solarized
