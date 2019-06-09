# Custom aliases
# For a full list of active aliases, run `alias`

# General
alias reload="source ~/.zshrc"
alias c="clear"
alias hg="history 0 | grep"

# Config
alias config.zsh="vim ~/.zshrc"
alias config.alias="vim ~/.zsh/alias.zsh"
alias config.keys="vim ~/.zsh/key-bindings.zsh"
alias config.prompt="vim ~/.zsh/prompt.zsh"
alias config.vim="vim ~/.vimrc"
alias config.tmux="vim ~/.tmux.conf"
alias config.alacritty="vim ~/.config/alacritty/alacritty.yml"

# Vim
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

# ls
alias ls="ls -GpF" # colorized, add a slash if it's a directory, show type 
alias l="ls -lFh" # size, show type, human readable
alias ll="ls -lh" # long list, human readable
alias la="ls -lAFh" # long list, show almost all, show type, human readable

# Git
alias gst="git status"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"

# Tmux
alias tn="tmux new -s"
alias ta="tmux a -t"
alias tl="tmux ls"
alias tk="tmux kill-session -t"

