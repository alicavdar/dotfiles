# Custom aliases
# For a full list of active aliases, run `alias`

# General
alias reload="exec zsh"
alias c="clear"
alias hg="history 0 | grep"
alias lg="lazygit"
alias du="ncdu"
alias eto="edit-tmux-output"
alias cat="bat --style=plain"
alias copy="pbcopy"
alias top="btop"

# Config
alias config.zsh="vim ~/.zshrc"
alias config.alias="vim ~/.zsh/alias.zsh"
alias config.functions="vim ~/.zsh/functions.zsh"
alias config.prompt="vim ~/.zsh/prompt.zsh"
alias config.vim="vim ~/.config/nvim -c 'cd ~/.config/nvim'"
alias config.tmux="vim ~/.tmux.conf"
alias config.alacritty="vim ~/.config/alacritty/alacritty.toml"
alias config.git="vim ~/.gitconfig"
alias config.extra="vim ~/.extra.sh"

# Vim
alias vi="nvim"
alias vim="nvim"

# cd
alias ..="cd .."
alias ...="cd ../.."

# ls
alias ls="ls -GpF" # colorized, add a slash if it's a directory, show type 
alias l="gls -lFh --color --group-directories-first" # size, show type, human readable
alias la="gls -lAFh --color --group-directories-first" # long list, show almost all, show type, human readable

# Git
alias gs="git status"
alias gst="git status"
alias gco="git checkout"
alias gd="git diff"

# Tmux
alias tn="tmux new -s"
alias ta="tmux a -t"
alias tl="tmux ls"
alias tk="tmux kill-session -t"

# Docker
alias docker="nerdctl"
alias dk="nerdctl"
alias dkps="nerdctl ps -a --format '{{.ID}} ~ {{.Names}} ~ {{.Status}} ~ {{.Image}}' | column -t -s '~'"
