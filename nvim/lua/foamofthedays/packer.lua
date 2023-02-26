vim.cmd [[packadd packer.nvim]]

-- Plug 'ray-x/lsp_signature.nvim'

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},              -- Required
      {'williamboman/mason.nvim'},            -- Optional
      {'williamboman/mason-lspconfig.nvim'},  -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'hrsh7th/cmp-buffer'},   -- Optional
      {'hrsh7th/cmp-cmdline'},  -- Optional

      -- Snippets
      { 'hrsh7th/vim-vsnip' }, -- Required
      { 'hrsh7th/vim-vsnip-integ' }, -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

  use 'sainnhe/sonokai'
  use 'tpope/vim-surround'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-vinegar'
  use 'wellle/targets.vim'
  use 'rhysd/clever-f.vim'
  use 'preservim/nerdtree'
  use 'mattn/emmet-vim'
  use 'windwp/nvim-autopairs'
  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
  use 'mbbill/undotree'

  use { 'junegunn/fzf', run = 'fzf#install()' }
  use 'junegunn/fzf.vim'
  use { 'yuki-yano/fzf-preview.vim', branch = 'release/rpc' } 

  use 'romgrk/barbar.nvim'
end)
