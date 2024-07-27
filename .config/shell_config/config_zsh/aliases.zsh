alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias grep='grep --color=auto'
alias wea_today='curl "wttr.in/Kathmandu?0"'
alias wea_kath='curl "wttr.in/Kathmandu"'

#################
#  git aliases  #
#################
alias ga='g a'
alias gaa='g aa'
alias gap='g ap'
alias gb='g b'
alias gcm='g commit'
alias gcob='g cob'
alias gco='g co'
alias gl='g l'
alias gll='g ll'
alias grl='g rl'
alias grll='g rll'
alias grh='g rh'
alias grb='g rb'
alias gm='g m'
alias gp='g p'
alias gs='g s'
alias gd='g d'
alias boot_to_windows='doas efibootmgr -n 0'
alias minicom='minicom -w -t xterm -l -R UTF-8'

alias ll='eza -l --icons=auto --group-directories-first'
alias l.='eza -d .*'
alias ls='eza'
alias l1='eza -1'

# ugrep for grep
alias grep='ug'
alias egrep='ug -E'
alias fgrep='ug -F'
alias xzgrep='ug -z'
alias xzegrep='ug -zE'
alias xzfgrep='ug -zF'

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"
