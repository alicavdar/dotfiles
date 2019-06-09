autoload -U colors && colors
setopt promptsubst

# Current directory & git info
PROMPT='%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0

  STATUS=$(command git status --porcelain --ignore-submodules=dirty 2> /dev/null | tail -n1)

  output="%{$fg_bold[cyan]%}git:"

  if [[ -n $STATUS ]]; then
    output+="%{$fg[green]%}${ref#refs/heads/}"
  else
    output+="%{$fg[red]%}${ref#refs/heads/}"
  fi

  output+=" "

  echo ${output}
}

