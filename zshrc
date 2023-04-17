# Set default encoding to UTF-8
export LANG=en_US.UTF-8

# Use nvim as the default editor
export EDITOR="nvim"

source "$HOME/.zsh/zsh-vim-mode.plugin.zsh"
source "$HOME/.zsh/completion.zsh"
source "$HOME/.zsh/alias.zsh"
source "$HOME/.zsh/prompt.zsh"
source "$HOME/.zsh/functions.zsh"
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.secrets.sh ] && source ~/.secrets.sh

autoload -Uz zcalc

# zsh vim mode
bindkey jj vi-cmd-mode
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down

# History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000

# History command configuration
setopt extended_history       # Record timestamp of command in HISTFILE
setopt inc_append_history     # Add commands to HISTFILE in order of execution
setopt hist_expire_dups_first # Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # Ignore duplicated commands history list
setopt hist_ignore_all_dups   # Delete old recorded entry if new entry is a duplicate
setopt hist_save_no_dups      # Don't add duplicate commands to HISTFILE
setopt hist_ignore_space      # Don't add commands starting with a space
setopt hist_verify            # Show command with history expansion to user before running it
setopt share_history          # Share history data between sessions

# Initialize jump
eval "$(jump shell --bind=z)"

# zsh-syntax-highligting without underlines
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# FZF color scheme
export FZF_DEFAULT_OPTS='
  --color=gutter:-1,bg:-1,hl:#ecc518
'

export XDG_CONFIG_HOME="$HOME/.config"

# Grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32' # Bright green

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export PATH="$HOME/bin:$PATH"
