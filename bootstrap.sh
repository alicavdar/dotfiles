#!/bin/zsh

mkdir -p "$HOME/bin"
mkdir -p "$HOME/.config/alacritty"
mkdir -p "$HOME/.config/lazygit"
mkdir -p "$HOME/.config/btop"
mkdir -p "$HOME/.vim/undo"
mkdir -p "$HOME/code"
mkdir -p "$HOME/code/lab"

# Disable "last login" message on terminal
touch ~/.hushlogin

typeset -A files=(
  "alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
  "zshrc" "$HOME/.zshrc"
  "zsh" "$HOME/.zsh"
  "tmux.conf" "$HOME/.tmux.conf"
  "tigrc" "$HOME/.tigrc"
  "btop.conf" "$HOME/.config/btop/btop.conf"
  "gitconfig" "$HOME/.gitconfig"
  "nvim" "$HOME/.config/nvim"
  "lazygit.yml" "$HOME/.config/lazygit/config.yml"
  "bin/edit-tmux-output.sh" "$HOME/bin/edit-tmux-output"
)

for src target in "${(@kv)files}"; do
  source="$(pwd)/$src"

  if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
    echo "[OK] Symlink already exists for $src -> $target"
  else
    ln -sF "$source" "$target"
    echo "[NEW] Symlink created for $src -> $target"
  fi
done

if [ ! -d "$HOME/.secrets.sh" ]; then
  touch $HOME/.secrets.sh
fi

# Install tmux plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# Clone kit
if [ ! -d "$HOME/code/lab/kit" ]; then
  git clone git@github.com:alicavdar/kit.git "$HOME/code/lab/kit"
fi
