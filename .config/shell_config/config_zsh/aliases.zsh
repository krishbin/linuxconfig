alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias grep='grep --color=auto'
alias ls=exa
alias ll=ls
alias wea_today='curl "wttr.in/Kathmandu?0"'
alias wea_kath='curl "wttr.in/Kathmandu"'
alias firefoxupdate='mkdir /tmp/firefox-latest && wget -P /tmp/firefox-latest "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=ro" && sudo rm -fr /opt/firefox && sudo tar xjf /tmp/firefox-latest/* -C /opt && rm -fr /tmp/firefox-latest'

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
