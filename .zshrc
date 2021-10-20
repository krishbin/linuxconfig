#zsh_setup
for f in ~/.config/shell_config/config_zsh/*(.); do source "$f"; done

for file in ~/.config/shell_config/plugins_zsh/*(.); do source "$file"; done

source ~/.config/shell_config/zsh-autosuggestions/zsh-autosuggestions.zsh

export GPG_TTY=$(tty)

export TMUXP_CONFIGDIR=$HOME/.config/tmuxp
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export PROMPT_EOL_MARK=''
export CARGO_HOME=/home/krishbin/.local/lang/rust/cargo
export PATH="$CARGO_HOME/bin:$PATH";
export RUSTUP_HOME=/home/krishbin/.local/lang/rust/rustup
export MOZ_ENABLE_WAYLAND=1

#symbiflow
export INSTALL_DIR=~/.local/symbiflow
export FPGA_FAM="xc7"
export PATH="$PATH:$INSTALL_DIR/$FPGA_FAM/install/bin";
# source "$INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"  # commented out by conda initialize

.local/scripts/startde.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/krishbin/.local/symbiflow/xc7/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/krishbin/.local/symbiflow/xc7/conda/etc/profile.d/conda.sh" ]; then
        . "/home/krishbin/.local/symbiflow/xc7/conda/etc/profile.d/conda.sh"
    else
        export PATH="/home/krishbin/.local/symbiflow/xc7/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
