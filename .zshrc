#zsh_setup
for f in ~/.config/shell_config/config_zsh/*(.); do source "$f"; done

for file in ~/.config/shell_config/plugins_zsh/*(.); do source "$file"; done

source ~/.config/shell_config/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/shell_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export GPG_TTY=$(tty)

export FZF_DEFAULT_COMMAND='fd --type file --follow --color=always --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--ansi"

export LIBVA_DRIVER_NAME=radeon
export VULKAN_SDK=$HOME/EnvSDK/vulkansdk/1.3.231.2/x86_64

export PROMPT_EOL_MARK=''
export CHROME_EXECUTABLE=chromium

export PATH="$HOME/.cargo/bin:$PATH:$HOME/.local/software/flutter/bin:$HOME/.local/software/Xilinx/Vivado/2022.2/bin"

eval "$(zoxide init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/krishbin/.local/software/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/krishbin/.local/software/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/krishbin/.local/software/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/krishbin/.local/software/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
