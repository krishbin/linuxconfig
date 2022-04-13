#zsh_setup
for f in ~/.config/shell_config/config_zsh/*(.); do source "$f"; done

for file in ~/.config/shell_config/plugins_zsh/*(.); do source "$file"; done

source ~/.config/shell_config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/shell_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export GPG_TTY=$(tty)

export FZF_DEFAULT_COMMAND='fd --type file --follow --color=always --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"
export PROMPT_EOL_MARK=''
export R_LIBS="/home/krishbin/.local/lib/R"

eval "$(zoxide init zsh)"

source /home/krishbin/.config/broot/launcher/bash/br
