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
  local active_worktree_path=$(git rev-parse --git-dir 2>/dev/null)

  if [[ "$1" == "." ]]; then
    git branch |
      grep --invert-match '\*' |
      cut -c 3- |
      fzf --multi --preview="git log {} --" |
      xargs -r git checkout

    return 0
  fi

  if [[ "$active_worktree_path" == *"worktrees"* ]]; then
    local worktree=$(git worktree list |
      awk 'NR > 1 { print $1 }' |
      fzf --height 40% --reverse --border --prompt "Select a worktree: ")

    local worktree_path=$(echo $worktree | awk '{ print $1 }')
    cd "$worktree_path"
  fi
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
