" Initialize vim-plug
source ~/.config/nvim/plug.vim

lua require("lsp")

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
set nohlsearch                    " Don't highlight searches
set incsearch                     " Show search matches when typing
set nobackup                      " Don't create backup files
set noswapfile                    " Don't use swap files
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
set termguicolors                 " Enable true colors

set autoindent      " Indent according to previous line
set expandtab       " Use spaces instead of tabs
set softtabstop=2   " Tab key indents by 2 spaces
set shiftwidth=2    " >> indents by 2 spaces
set shiftround      " >> indents to next multiple of 'shiftwidth'

"Hide status line
set noruler
set laststatus=0
set noshowcmd
set noshowmode

" Folding
set foldlevel=20 " Opens all folds when opening a file
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

let &fcs='eob: ' " Hide the tilde (~) sign on blank lines

" Theme
set background=dark
let g:sonokai_transparent_background = 1
colorscheme sonokai

filetype plugin indent on     " Load plugins according to detected filetype
syntax on                     " Enable syntax highlighting

" Maintain undo history 
set undofile 
set undodir=~/.vim/undo

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Use Space for the leader
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
cnoreabbrev Bd bd
cnoreabbrev bD bd
cnoreabbrev BD bd
cnoreabbrev Bd! bd!
cnoreabbrev bD! bd!
cnoreabbrev BD! bd!
cnoreabbrev E! e!

" Easy navigation between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easy navigation between buffers
map gn :bn<CR>
map gp :bp<CR>

" Make search results appear in the middle of the screen
:nnoremap n nzz
:nnoremap N Nzz
:nnoremap * *zz

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

" Behave like D and C
nnoremap Y y$

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap <Space> <Space><c-g>u

" Neovim Terminal
tnoremap <Esc> <C-\><C-n>

" PLUGIN CONFIGS

"  vim-slime
let g:slime_target = "tmux"

set completeopt=menuone,noinsert,noselect
set shortmess+=c

inoremap <C-Space> <C-x><C-o>

" Setup NVIM TreeSitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  incremental_selection = { enable = false },
  ensure_installed = {'javascript'}
}
EOF

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " Use ag (the silver searcher as default)
nnoremap <silent> <leader>a :Ag<Space>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :FzfPreviewGitStatusRpc<CR>
nnoremap <silent> <leader>t :Filetypes<CR>
nnoremap <silent> <C-p> :Buffers<CR>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

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

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
augroup END
