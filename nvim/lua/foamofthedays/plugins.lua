local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},              -- Required
      {'williamboman/mason.nvim'},            -- Optional
      {'williamboman/mason-lspconfig.nvim'},  -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'hrsh7th/cmp-buffer'},   -- Optional
      {'hrsh7th/cmp-path'},     -- Optional
      {'hrsh7th/cmp-cmdline'},  -- Optional

      -- Snippets
      {'hrsh7th/vim-vsnip'}, -- Required
      {'hrsh7th/vim-vsnip-integ'}, -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  },

  'j-hui/fidget.nvim',

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-live-grep-args.nvim",
    }
  },

  'sainnhe/sonokai', -- Colorscheme

  'tpope/vim-fugitive',
  'tpope/vim-rhubarb', -- Github extension for vim-fugitive
  'tpope/vim-vinegar',
  'tpope/vim-surround',
  'tpope/vim-sleuth',

  'numToStr/Comment.nvim',
  'wellle/targets.vim',
  'rhysd/clever-f.vim',
  'mattn/emmet-vim',
  'windwp/nvim-autopairs',
  'mbbill/undotree',
  'ray-x/lsp_signature.nvim',
  'stevearc/aerial.nvim',
  'sbdchd/neoformat',
})

