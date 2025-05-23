export HOMEBREW_NO_ANALYTICS=1
eval "$(/opt/homebrew/bin/brew shellenv)"

# Default config path
export XDG_CONFIG_HOME="$HOME/.config"

# Set default encoding to UTF-8
export LANG=en_US.UTF-8

# Use nvim as the default editor
export EDITOR="nvim"

source "$HOME/.zsh/completion.zsh"
source "$HOME/.zsh/alias.zsh"
source "$HOME/.zsh/prompt.zsh"
source "$HOME/.zsh/functions.zsh"
source "$HOME/.extra.sh"

# VIM
source "$HOME/.zsh/zsh-vim-mode.plugin.zsh"
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

# Highlighting
source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='none'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='none'

# Substring search
source "$HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
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

# FZF
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='
  --color=gutter:-1,bg:-1,hl:#ecc518
'

# Grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32' # Bright green

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Python
PATH=$(pyenv root)/shims:$PATH

export PATH="$HOME/bin:$PATH"
