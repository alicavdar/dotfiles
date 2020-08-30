" Initialize vim-plug
source ~/.vim-plug.vim

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
set scrolloff=999

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

" clever-f
" Search a character only in current line
let g:clever_f_across_no_line = 1
" Fix a direction search (always f: forward, F: backward)
let g:clever_f_fix_key_direction = 1

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
command! Q q
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
noremap <C-u> 5<C-u>

" fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

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

" coc.nvim
nmap <silent> gd <Plug>(coc-definition)
