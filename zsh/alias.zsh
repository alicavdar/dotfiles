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

# cd
alias ..="cd .."

# ls
alias ls="ls -GpF" # colorized, add a slash if it's a directory, show type 
alias l="gls -lFh --color --group-directories-first" # size, show type, human readable
alias la="gls -lAFh --color --group-directories-first" # long list, show almost all, show type, human readable

# Git
alias gst="git status"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"
alias gsl="git stash list"
alias gss="git stash save"
alias gsa="git stash apply"
alias gsd="git stash drop"

# Tmux
alias tn="tmux new -s"
alias ta="tmux a -t"
alias tl="tmux ls"
alias tk="tmux kill-session -t"

# URL encode / decode with Python
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

# ag - Ignore long lines with "less"
function agl() {
  ag --color $1 | less -R -S
}
