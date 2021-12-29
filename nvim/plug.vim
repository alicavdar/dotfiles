call plug#begin('~/.vim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'sainnhe/sonokai'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'wellle/targets.vim'
Plug 'rhysd/clever-f.vim'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-buftabline'
Plug 'jpalardy/vim-slime'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


call plug#end()
