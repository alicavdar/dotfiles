" Initialize vim-plug
source ~/.vim-plug.vim

set nocompatible      " Use Vim not Vi
set shell=/bin/zsh    " Set zsh as a default shell
set ttyfast           " Faster redrawing
set lazyredraw        " Only draw when necessary
set updatetime=300

set encoding=utf-8                " Set default encoding to UTF-8
set number                        " Show line numbers
set relativenumber                " Enable relative numbers
set clipboard=unnamed             " Yank to system clipboard
set backspace=indent,eol,start    " Make backspace work as expected
set smartcase                     " When searching try to be smart about cases
set ignorecase                    " Ignore case of searches
set hlsearch                      " Highlight searches
set incsearch                     " Show search matches when typing
set nobackup                      " Don't create backup files
set noswapfile                    " Don't use swap files
set noshowmode                    " Don't show mode status since the custom status line has it already
set hidden                        " Switch between buffers without having to save first
set smarttab                      " Enable smarttab
set autoread                      " Auto refresh if the file has been changed outside of VIM
set wildmenu                      " Enhance command-line completion
set nocursorline                  " Hide cursorline
set linebreak                     " Break long lines by word, not char
set scroll=10                     " Number of lines to scroll with ^U/^D
set splitright                    " Open new windows below the current window.
set splitbelow                    " Open new windows right of the current window.
set mouse=a                       " Enable mouse
set shortmess+=c                  " Don't pass messages to |ins-completion-menu|
set signcolumn=yes                " Always show the sign column
set showcmd                       " Show pressed keys
set foldmethod=syntax
set nomodeline
set nofoldenable

let &fcs='eob: ' " Hide the tilde (~) sign on blank lines

set autoindent      " Indent according to previous line
set expandtab       " Use spaces instead of tabs
set softtabstop=2   " Tab key indents by 2 spaces
set shiftwidth=2    " >> indents by 2 spaces
set shiftround      " >> indents to next multiple of 'shiftwidth'

" Enable true colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Theme
set background=dark
colorscheme jellybeans
let g:jellybeans_overrides = {
\ 'background': { 'guibg': '000000' },
\ 'SignColumn': { 'guibg': '000000' },
\ 'Folded': { 'guibg': '000000' },
\ 'VertSplit': { 'guibg': '', 'ctermbg': ''},
\}

" Custom Status Line
let g:currentMode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

autocmd ColorScheme * call StatusLineColorScheme()

function! StatusLineColorScheme() abort
  hi default StatusLineModeColor guifg=#00005f guibg=#dfff00 ctermfg=17 ctermbg=190
  hi default StatusLineFilePathColor guifg=#ffffff guibg=#161616 ctermfg=255 ctermbg=238
  hi default StatusLineFileInfoColor guifg=#00005f guibg=#dfff00 ctermfg=17 ctermbg=190
endfunction

set laststatus=2
set statusline=
set statusline+=%#StatusLineModeColor#                      " Color
set statusline+=\ %{toupper(g:currentMode[mode()])}\        " The current mode
set statusline+=%#StatusLineFilePathColor#                  " Color
set statusline+=\ %f                                        " File path (Relative)
set statusline+=\ %m                                        " Modified flag [+]
set statusline+=%=                                          " Right Side
set statusline+=\ %y                                        " FileType
set statusline+=\ %#StatusLineFileInfoColor#                " Color
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}  " File encoding
set statusline+=\[%{&fileformat}\]                          " File format
set statusline+=\ %02l/%L                                   " Line number / total lines
set statusline+=\:\%02v\                                    " Column number

filetype plugin indent on     " Load plugins according to detected filetype
syntax on                     " Enable syntax highlighting

" Maintain undo history 
" The undo files will be stored ~/.vim/undo
set undofile 
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undo
endif

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Use comma for the leader
let mapleader = "\<Space>"

" Easier escape than ESC
inoremap jj <ESC>

" Clear search highlighting
nmap <leader>q :nohlsearch<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Switch between last visited buffers
nmap <leader>e :e#<CR> 

" Fixing some annoying typos I often do
" Such as "q:" instead of ":q"
cnoreabbrev q: :q
cnoreabbrev Q! q!
cnoreabbrev Q q
cnoreabbrev W! w!
cnoreabbrev Q q
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev Qa qa
cnoreabbrev QA qa

" Easy navigation between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easy navigation between buffers
map gn :bn<CR>
map gp :bp<CR>

" Close the buffer
nnoremap <leader>d :bp\|bd #<CR>

" Search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Copy current file name (relative/absolute) to system clipboard
" Relative path (src/foo.txt)
nnoremap <leader>cf :let @*=expand("%")<CR>
" Absolute path (/something/src/foo.txt)
nnoremap <leader>cF :let @*=expand("%:p")<CR>
" Filename (foo.txt)
nnoremap <leader>ct :let @*=expand("%:t")<CR>

" Easier navigation
noremap H ^
noremap L $

" use `u` to undo, use `U` to redo
noremap U <C-r>

" Moving the cursor through long soft-wrapped lines
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" Resize windows with arrow keys
nnoremap <Left>  <C-w>>
nnoremap <Right> <C-w><
nnoremap <Up>    <C-w>-
nnoremap <Down>  <C-w>+

" PLUGIN CONFIGS

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " Use ag (the silver searcher as default)
let g:fzf_layout = { 'window': 'enew' } " Full screen
nnoremap <silent> <leader>a :Ag<Space>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <C-p> :Buffers<CR>
nnoremap <silent> <leader>t :Filetypes<CR>

" Hide statusline
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" coc.nvim
nmap <silent> gd <Plug>(coc-definition)

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile " Setup
nnoremap <leader>p :Prettier<CR>

" clever-f
let g:clever_f_across_no_line = 1  " Search a character only in current line
let g:clever_f_fix_key_direction = 1 " Fix a direction search (always f: forward, F: backward)

" NERDTree
let g:NERDTreeStatusline = '%#NonText#' " Hide status bar
let NERDTreeMinimalUI = 1 " Minimal UI
let NERDTreeShowHidden = 1 " Show hidden files
let NERDTreeIgnore=['\.DS_Store$']

" Toggle NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>
" Reveal the current buffer in NERDTree window
nnoremap <C-r> :NERDTreeFind<CR>

" Emmet.vim
" Use tab key as abbreviation expander
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
