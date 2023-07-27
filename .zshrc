#zsh_setup
for f in ~/.config/shell_config/config_zsh/*(.); do source "$f"; done
for file in ~/.config/shell_config/plugins_zsh/*(.); do source "$file"; done

source ~/.config/shell_config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/shell_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export GPG_TTY=$(tty)

export FZF_DEFAULT_COMMAND='fd --type file --follow --color=always --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"

export PROMPT_EOL_MARK=''
export CHROME_EXECUTABLE=microsoft-edge

export PATH="$HOME/.cargo/bin:$PATH:$HOME/.SDK/flutter/bin:$HOME/.local/software/Xilinx/Vivado/2022.2/bin:$HOME/.local/bin"

eval "$(zoxide init zsh)"

#Pico
export PICO_SDK_PATH="$HOME/Boards/raspberry/pico/pico-sdk"
export PICO_EXTRAS_PATH="$HOME/Boards/raspberry/pico/pico-extras"
export PICO_PLAYGROUND_PATH="$HOME/Boards/raspberry/pico/pico-playground"
export PICO_EXAMPLES_PATH="$HOME/Boards/raspberry/pico/pico-examples"

# export DENO_INSTALL="/home/krishbin/.deno"
# export PATH="$DENO_INSTALL/bin:$FLUTTER_PATH/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/software/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/software/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/software/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/software/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

