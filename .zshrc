#zsh_setup
for f in ~/.config/shell_config/config_zsh/*(.); do source "$f"; done
for file in ~/.config/shell_config/plugins_zsh/*(.); do source "$file"; done

source ~/.config/shell_config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/shell_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

__conda_setup="$('/usr/local/software/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
eval "$__conda_setup"
unset __conda_setup

export GPG_TTY=$(tty)
export PATH="$HOME/.cargo/bin:$PATH:$HOME/.SDK/flutter/bin:/usr/local/software/Xilinx/Vivado/2023.1/bin:$HOME/.local/bin"

export RMW_IMPLEMENTATION=rmw_connextdds
#source /usr/local/humble_ws/install/local_setup.zsh
