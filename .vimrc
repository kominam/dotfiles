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

" ncoc
set updatetime=300
set shortmess+=c
set signcolumn=yes

" enable mouse
set mouse=a

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

let mapleader=" "
nnoremap <leader>s :w<CR>

" Tab
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tc :tabclose<CR>

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
      \ 'colorscheme': 'onedark',
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
nnoremap <leader>p :Files<CR>
nnoremap <leader>' :Buffers<CR>
noremap <leader>rg <ESC>:Rg<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             NERDTree                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeMinimalUI=1
let g:NERDTreeStatusline = '%#NonText#'

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-g> :NERDTreeFind<CR>

" Auto pair
let g:endwise_no_mappings = 1
let g:AutoPairsMultilineClose = 0
let vim_markdown_preview_github=1
let g:move_key_modifier = 'C'

" IndentLine
let g:indentLine_char = '|'
let g:indentLine_color_gui = '#363244'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             Coc.vim                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

let g:coc_snippet_next = '<tab>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

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
  let branch = FugitiveHead()
  return branch !=# '' ? " ".branch : ""
endfunction

autocmd BufWrite *.* :call TrailingWhitespace()

" ---------------------- PLUGIN CONFIGURATION ----------------------
source ~/.config/nvim/plugins.vim

" set background=dark
if (has("termguicolors"))
 set termguicolors
endif

syntax enable
let g:oceanic_next_terminal_bold = 0
let g:oceanic_next_terminal_italic = 0
colorscheme onedark
" colorscheme OceanicNext
