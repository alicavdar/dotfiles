# Set default encoding to UTF-8
export LANG=en_US.UTF-8

# Use nvim as the default editor
export EDITOR=nvim

source ~/.zsh/key-bindings.zsh 
source ~/.zsh/completion.zsh
source ~/.zsh/alias.zsh
source ~/.zsh/prompt.zsh

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

# Initialize autojump
source /usr/local/etc/profile.d/autojump.sh

# zsh-syntax-highligting without underlines
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# FZF color scheme
export FZF_DEFAULT_OPTS='
  --color=fg:-1,bg:-1,hl:#ecc518
  --color=fg+:#d0d0d0,bg+:#000000,hl+:#ecc518
  --color=info:#afaf87,prompt:#ecc518,pointer:#ecc518
  --color=marker:#87ff00,spinner:#ecc518,header:#8ecc51
'

# Grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32' # Bright green

# Load secrets
[ -f ~/.secrets.sh ] && source ~/.secrets.sh

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

