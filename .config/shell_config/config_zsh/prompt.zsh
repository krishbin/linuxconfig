#git-integration
autoload -Uz vcs_info
precmd() {
        vcs_info
}
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "  %F{144}%b%f%F{103}%m%u%c%f"
zstyle ':vcs_info:*' actionformats '%F{96}[%F{61}%F{61}[%F{113}%b%F{8}|%F{110}%a%F{61}]%f'
setopt PROMPT_SUBST

parse_git_branch() {
        git_id="$(git rev-parse --short HEAD 2> /dev/null)"
        if [[ $? == 0 ]]; then
                echo "%F{102}@%f%F{108}${git_id}%f"
        fi
}

arrow_char="%B%b"
# An exclamation point if the previous command did not complete successfully

#prompt setup
NEWLINE=$'\n'
# PROMPT='${NEWLINE}'
# PROMPT='%F{172}%n%f ' #username
# PROMPT+=' at '
PROMPT='%F{143}${${(%):-%m}#Krishbins-}%f ' #hostname
# PROMPT+=' in '
PROMPT+='%F{137}${PWD/#$HOME/%B~%b}%f' #directory
PROMPT+='${vcs_info_msg_0_}$(parse_git_branch) ' #git info
RPROMPT="%F{249}%*%f"
