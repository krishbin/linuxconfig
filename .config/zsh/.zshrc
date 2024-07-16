for f in ~/.config/shell_config/config_zsh/*(.); do source "$f"; done
for file in ~/.config/shell_config/plugins_zsh/*(.); do source "$file"; done

source ~/.config/shell_config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/shell_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# export GPG_TTY=$(tty)

compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
export HISTFILE="$XDG_STATE_HOME"/zsh/history

eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
# eval "$(starship init zsh)"
