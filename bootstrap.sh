mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
mkdir -p ~/.vim/undo
mkdir -p ~/code

ln -sF $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sF $(PWD)/zshrc ~/.zshrc
ln -sF $(PWD)/zsh ~/.zsh
ln -sF $(PWD)/tmux.conf ~/.tmux.conf
ln -sF $(PWD)/tigrc ~/.tigrc
ln -sF $(PWD)/gitconfig ~/.gitconfig
ln -sF $(PWD)/vimrc ~/.vimrc
ln -sF $(PWD)/vim-plug.vim ~/.vim-plug.vim
ln -sF $(PWD)/nvim ~/.config/nvim/init.vim
ln -sF $(PWD)/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
