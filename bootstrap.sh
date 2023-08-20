mkdir ~/bin
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/lazygit
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
ln -sF $(PWD)/lazygit.yml ~/.config/lazygit/config.yml
ln -sF $(PWD)/bin/edit-tmux-output.sh ~/bin/edit-tmux-output

# Install nvm.sh manually since homebrew installation is not supported.
# See https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
