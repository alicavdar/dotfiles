" Initialize vim-plug
source ~/.vim-plug.vim

" Initialize deoplete at startup
let g:deoplete#enable_at_startup = 1

set nocompatible      " Use Vim not Vi
set shell=/bin/zsh    " Set zsh as a default shell
set ttyfast           " Faster redrawing
set lazyredraw        " Only draw when necessary

set encoding=utf-8                " Set default encoding to UTF-8
set number                        " Show line numbers
set relativenumber                " Enable relative numbers
set clipboard=unnamed             " Clipboard without pbcopy
set backspace=indent,eol,start    " Make backspace work as expected
set smartcase                     " When searching try to be smart about cases
set ignorecase                    " Ignore case of searches
set hlsearch                      " Highlight searches
set incsearch                     " Show search matches when typing
set nobackup                      " Don't create backup files
set noswapfile                    " Don't use swap files
set noshowmode                    " Don't show mode status, it's unnecessary with vim-airline
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

set foldmethod=syntax
set foldlevelstart=99 " Start file with all fold opened


" Enable true colors
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set autoindent      " Indent according to previous line
set expandtab       " Use spaces instead of tabs
set softtabstop=2   " Tab key indents by 2 spaces
set shiftwidth=2    " >> indents by 2 spaces
set shiftround      " >> indents to next multiple of 'shiftwidth'

" Theme
set background=dark
colorscheme jellybeans
let g:jellybeans_overrides = {
\ 'background': { 'guibg': '000000' },
\ 'SignColumn': { 'guibg': '000000' },
\ 'Folded': { 'guibg': '000000' },
\}

filetype plugin indent on     " Load plugins according to detected filetype
syntax on                     " Enable syntax highlighting

" Vim randomly breaks syntax highlighting.
" This config fixes the issue.
" set maxmempattern=20000
" syntax sync minlines=20

" Maintain undo history 
" The undo files will be stored ~/.vim/undo
set undofile 
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/undo
endif

" Vim Airline
let g:airline_theme = 'dark_minimal'
let g:airline#extensions#tabline#enabled = 1                " Smarter tab line
let g:airline#extensions#tabline#formatter = 'unique_tail'  " Show only file name on tabs and buffers
let g:airline#extensions#tabline#tab_nr_type = 1            " Show tab numbers
let g:airline#extensions#tabline#buffer_nr_show = 1         " Show buffer numbers
let g:airline#extensions#branch#enabled = 0                 " Don't show branch name

" netrw - Vim File Explorer
let g:netrw_bufsettings = "noma nomod nonu nobl nowrap ro rnu" " Enable relative line numbers
let g:netrw_fastbrowse = 0

" fzf
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " Use ag (the silver searcher as default)
let g:fzf_layout = { 'window': 'enew' } " Full screen

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Use comma for the leader
let mapleader = ","

" Easier escape than ESC
inoremap jj <ESC>

" Clear search highlighting
nmap <leader>q :nohlsearch<CR>

" Fast saving
nmap <leader>w :w!<cr>

" Switch between last visited buffers
nmap <leader>e :e#<CR> 

" Align indentation for current code block
noremap <leader>a =ip 

" Fixing some annoying typos I often do
" Such as "q:" instead of ":q"
nnoremap q: :q
command! W w
command! Qa qa
command! QA qa

" Easy navigation between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easy navigation between buffers
map gn :bn<CR>
map gp :bp<CR>

" Close the buffer
noremap <leader>d :bd<CR>

" Disable arrow keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Disable arrow keys in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" Centralize the matching
nnoremap n nzz
nnoremap N Nzz

" Number of lines to scroll with ^U/^D
" https://stackoverflow.com/questions/9906328/vim-scroll-setting-overridden
noremap <C-u> 10<C-u>

" fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" Search for visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
