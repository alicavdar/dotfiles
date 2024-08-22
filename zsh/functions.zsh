function mcd() {
  mkdir -p "$1" && cd "$1"
}

# ag - Ignore long lines with "less"
function agl() {
  ag --color $1 | less -R -S
}

function package() {
  cat package.json | jq .$1
}

function delete_branches() {
  git branch |
    grep --invert-match '\*' |
    cut -c 3- |
    fzf --multi --preview="git log {} --" |
    xargs -r git branch --delete --force
}

function gc() {
  git branch |
    grep --invert-match '\*' |
    cut -c 3- |
    fzf --multi --preview="git log {} --" |
    xargs -r git checkout
}

function load_nvm() {
  export NVM_DIR=~/.nvm
  [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
}

# You might need to run `yarn unlink node`
function link_nvm() {
  sudo rm -f /usr/local/bin/node
  sudo rm -f /usr/local/bin/npm
  sudo ln -s $(which node) /usr/local/bin/
  sudo ln -s $(which npm) /usr/local/bin/
}

function ip() {
  curl -s ipinfo.io | jq .ip | tr -d \"
}

function ipc() {
  ip | pbcopy
}

function docker_start() {
  open -a "Docker Desktop"
}

function docker_quit() {
  osascript -e 'quit app "Docker Desktop"'
}
