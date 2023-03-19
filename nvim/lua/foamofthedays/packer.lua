vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter",
  })

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

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'sainnhe/sonokai'
  use 'tpope/vim-surround'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-fugitive'
  use 'wellle/targets.vim'
  use 'rhysd/clever-f.vim'
  use 'preservim/nerdtree'
  use 'mattn/emmet-vim'
  use 'windwp/nvim-autopairs'
  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
  use 'mbbill/undotree'
  use 'ray-x/lsp_signature.nvim'
  use 'stevearc/aerial.nvim'
end)
