# Enable advanced tab completion
autoload -Uz compinit

if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# autocompletion with an arrow-key driven interface
# It also highlights
zstyle ':completion:*:*:*:*:*' menu select

# Partial-word and substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
