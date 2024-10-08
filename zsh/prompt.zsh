autoload -U colors && colors
setopt promptsubst

PROMPT='$(prepare_zsh_prompt)'

function prepare_zsh_prompt() {
  local ref
  ref=$(command git symbolic-ref HEAD 2>/dev/null) ||
    ref=$(command git rev-parse --short HEAD 2>/dev/null)

  if [[ -n "$ref" ]]; then
    echo "$(zsh_git_prompt) "
    return 0
  fi

  if [[ "$HOME" == "$(pwd)" ]]; then
    echo "~ "
    return 0
  fi

  echo "$(basename $(pwd)) "
}

function zsh_git_prompt() {
  local active_worktree_path=$(git rev-parse --git-dir 2>/dev/null)

  local active_dir_name=$(basename $(pwd))
  local git_prefix="git"

  if [[ "$active_worktree_path" == *"worktrees"* ]]; then
    if [[ "$(git rev-parse --show-toplevel)" == "$(pwd)" ]]; then
      active_dir_name=$(basename $(dirname "$(pwd)"))
    fi

    # The active worktree name
    git_prefix=$(echo $active_worktree_path | awk -F/ '{ print $NF }')
  fi

  output="$active_dir_name %{$fg_bold[cyan]%}$git_prefix:"

  local git_status=$(command git status --porcelain --ignore-submodules=dirty 2>/dev/null | tail -n1)
  local branch="${ref#refs/heads/}"
  if [[ -n $git_status ]]; then
    output+="%{$fg[green]%}$branch"
  else
    output+="%{$fg[red]%}$branch"
  fi

  echo $output
}
