autoload -U colors && colors
setopt promptsubst

PROMPT='$(prepare_zsh_prompt)'

function prepare_zsh_prompt() {
  local ref
  ref=$(command git symbolic-ref HEAD 2>/dev/null) ||
    ref=$(command git rev-parse --short HEAD 2>/dev/null)

  if [[ -n "$ref" ]]; then
    zsh_git_prompt "$ref"
    return 0
  fi

  if [[ "$PWD" == "$HOME" ]]; then
    echo "~ "
    return 0
  fi

  echo "${PWD:t} "
}

function zsh_git_prompt() {
  local ref="$1"
  local branch="${ref#refs/heads/}"

  if (( ${#branch} > 15 )); then
    branch="${branch:0:15}"
  fi

  if command git diff-index --quiet HEAD -- 2>/dev/null && \
     [[ -z "$(command git ls-files --others --exclude-standard 2>/dev/null)" ]]; then
    echo "${PWD:t} %{$fg_bold[cyan]%}git:%{$fg[red]%}$branch "
  else
    echo "${PWD:t} %{$fg_bold[cyan]%}git:%{$fg[green]%}$branch "
  fi
}
