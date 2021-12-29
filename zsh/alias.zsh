# Custom aliases
# For a full list of active aliases, run `alias`

# General
alias reload="source ~/.zshrc"
alias c="clear"
alias hg="history 0 | grep"
alias calc="zcalc"
alias lg="lazygit"

# Config
alias config.zsh="vim ~/.zshrc"
alias config.alias="vim ~/.zsh/alias.zsh"
alias config.functions="vim ~/.zsh/functions.zsh"
alias config.keys="vim ~/.zsh/key-bindings.zsh"
alias config.prompt="vim ~/.zsh/prompt.zsh"
alias config.vim="vim ~/.config/nvim/init.vim"
alias config.tmux="vim ~/.tmux.conf"
alias config.alacritty="vim ~/.config/alacritty/alacritty.yml"
alias config.git="vim ~/.gitconfig"

# Vim
alias vi="nvim"
alias vim="nvim"

# cd
alias ..="cd .."

# ls
alias ls="ls -GpF" # colorized, add a slash if it's a directory, show type 
alias l="gls -lFh --color --group-directories-first" # size, show type, human readable
alias la="gls -lAFh --color --group-directories-first" # long list, show almost all, show type, human readable

# Git
alias gs="git status"
alias gst="git status"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"
alias gb="git branch"
alias gbd="git branch -D"
alias gsl="git stash list"
alias gss="git stash save"
alias gsa="git stash apply"
alias gsd="git stash drop"

# Tmux
alias tn="tmux new -s"
alias ta="tmux a -t"
alias tl="tmux ls"
alias tk="tmux kill-session -t"

