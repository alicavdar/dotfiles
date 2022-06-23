call plug#begin('~/.vim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'williamboman/nvim-lsp-installer'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
Plug 'sainnhe/sonokai'
Plug 'tpope/vim-surround'
Plug 'numtostr/comment.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'wellle/targets.vim'
Plug 'rhysd/clever-f.vim'
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'romgrk/barbar.nvim'
Plug 'jpalardy/vim-slime'

call plug#end()
