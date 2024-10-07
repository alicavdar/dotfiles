mkdir ~/bin
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/lazygit
mkdir -p ~/.vim/undo
mkdir -p ~/code
mkdir -p ~/code/lab

# Disable "last login" message on terminal
touch ~/.hushlogin

ln -sF $(PWD)/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sF $(PWD)/zshrc ~/.zshrc
ln -sF $(PWD)/zsh ~/.zsh
ln -sF $(PWD)/tmux.conf ~/.tmux.conf
ln -sF $(PWD)/tigrc ~/.tigrc
ln -sF $(PWD)/btop.conf ~/.config/btop/btop.conf
ln -sF $(PWD)/gitconfig ~/.gitconfig
ln -sF $(PWD)/nvim ~/.config/nvim
ln -sF $(PWD)/lazygit.yml ~/.config/lazygit/config.yml
ln -sF $(PWD)/bin/edit-tmux-output.sh ~/bin/edit-tmux-output

# Clone kit
git clone git@github.com:alicavdar/kit.git ~/code/lab/kit

# Install nvm.sh manually since homebrew installation is not supported.
# See https://github.com/nvm-sh/nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
