" turn on syntax highlighting
syntax on

" make vim try to detect file types and load plugins for them
filetype on
filetype plugin indent on

" reload files changed outside vim
set autoread
set encoding=utf8

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

set splitright
set splitbelow
set ttyfast
set lazyredraw

set noswapfile
set wrap " wrap long lines

set wildmenu
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignorecase

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" auto complete parenthesis
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()

let mapleader=" "
nnoremap <leader>s :w<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            ALE                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
\ 'ruby': ['rubocop']
\ }
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_lint_on_text_changed="never"
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 0
let g:ale_set_quickfix = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Lightline                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ ['mode'], ['filename'] ],
      \   'right': [ ['gitbranch'], ['lineinfo'], ['alestatus'] ]
      \ },
      \ 'component': { 'lineinfo': ' %2p%% %3l:%-2v' },
      \ 'component_function': {
      \   'filename': 'LightLineFilename',
      \   'gitbranch': 'GitBranchInfo',
      \   'alestatus': 'LinterStatus'
      \ },
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             FZF                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
nnoremap <leader>p :GFiles<CR>
noremap <leader>rg <ESC>:Rg<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Custom functions                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! TrailingWhitespace()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunction

function! LightLineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✓' : printf(
  \   'Linter %dℹ️ %d⛔️',
  \   all_non_errors,
  \   all_errors
  \)
endfunction

function! GitBranchInfo()
  let branch = fugitive#head()
  return branch !=# '' ? " ".branch : ""
endfunction

autocmd BufWrite *.* :call TrailingWhitespace()

" ---------------------- PLUGIN CONFIGURATION ----------------------
source ~/.vim/plugins.vim

set background=dark
colorscheme solarized
