mcd () {
  mkdir -p "$1" && cd "$1"
}

# ag - Ignore long lines with "less"
function agl() {
  ag --color $1 | less -R -S
}

function package() {
  cat package.json | jq .$1
}

function delete-branches() {
  git branch |
    grep --invert-match '\*' |
    cut -c 3- |
    fzf --multi --preview="git log {} --" |
    xargs -r git branch --delete --force
}

load_nvm() {
  export NVM_DIR=~/.nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
}
