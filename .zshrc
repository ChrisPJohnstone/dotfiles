parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='[%D{%f/%m/%y} %D{%L:%M:%S}] [%d] $(parse_git_branch) ${NEWLINE}%% '
