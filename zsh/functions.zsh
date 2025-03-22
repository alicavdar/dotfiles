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
  if [[ -n "$1" && "$1" == "." ]]; then
    _gc
    return 0
  fi

  if [[ -n "$1" ]]; then
    local worktree=$(git worktree list | awk '$1 ~ /\/'$1'$/')

    if [[ -n "$worktree" ]]; then
      cd $(echo "$worktree" | awk '{print $1 }')
      return 0
    fi
  fi

  local active_worktree_path=$(git rev-parse --git-dir 2>/dev/null)

  if {
    git rev-parse --is-bare-repository &>/dev/null &&
      [[ "$(git rev-parse --is-bare-repository)" == "true" ]]
  } ||
    [[ "$active_worktree_path" == *"worktrees"* ]]; then
    local worktree=$(git worktree list |
      awk 'NR > 1 { print $3, $1 }' | column -t |
      fzf --height 20% --reverse --border --prompt "Select a worktree: " |
      awk '{ print $2 }')

    if [[ -n "$worktree" ]]; then
      cd "$worktree"
    fi
  else
    _gc
  fi
}

function _gc {
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
