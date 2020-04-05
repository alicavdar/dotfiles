if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-scripts/matchit.zip'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'wellle/targets.vim'
Plug 'rhysd/clever-f.vim'
Plug 'noahfrederick/vim-noctu'

call plug#end()
