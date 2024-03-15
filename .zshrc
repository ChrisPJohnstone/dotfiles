parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/ [\1]/p'
}
setopt PROMPT_SUBST
export PROMPT='%K{cyan}%F{black}[%D{%T}] [%1~]$(parse_git_branch)%k%f '
