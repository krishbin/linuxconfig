#zsh_setup
for f in ~/.config/shell_config/config_zsh/*(.); do source "$f"; done

for file in ~/.config/shell_config/plugins_zsh/*(.); do source "$file"; done

source ~/.config/shell_config/zsh-autosuggestions/zsh-autosuggestions.zsh

export TMUXP_CONFIGDIR=$HOME/.config/tmuxp
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export PROMPT_EOL_MARK=''
export CARGO_HOME=/home/krishbin/.local/lang/rust/cargo
export RUSTUP_HOME=/home/krishbin/.local/lang/rust/rustup

source /home/krishbin/.config/broot/launcher/bash/br

#symbiflow
export INSTALL_DIR=~/.local/symbiflow
export FPGA_FAM="xc7"
export PATH="$INSTALL_DIR/$FPGA_FAM/install/bin:$PATH";
source "$INSTALL_DIR/$FPGA_FAM/conda/etc/profile.d/conda.sh"

.local/scripts/startde.sh
