mkdir -p ~/.config/alacritty
mkdir -p ~/.vim/undo
mkdir -p ~/code

# Disable "last login" message on terminal
touch ~/.hushlogin

ln -sF $(PWD)/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sF $(PWD)/zshrc ~/.zshrc
ln -sF $(PWD)/zsh ~/.zsh
ln -sF $(PWD)/tmux.conf ~/.tmux.conf
ln -sF $(PWD)/tigrc ~/.tigrc
ln -sF $(PWD)/gitconfig ~/.gitconfig
ln -sF $(PWD)/nvim ~/.config/nvim

# Install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install nvm.sh manually since homebrew installation is not supported.
# See https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
