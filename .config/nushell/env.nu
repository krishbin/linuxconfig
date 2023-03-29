# Nushell Environment Config File

def create_left_prompt [] {
    let path_segment = if (is-admin) {
        $"(ansi red_bold)($env.PWD)"
    } else {
        $"(ansi green_bold)($env.PWD)"
    }

    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        (date now | date format '%m/%d/%Y %r')
    ] | str join)

    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { "〉" }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
let-env EDITOR = "nvim"
let-env PATH = ($env.PATH | split row (char esep) | prepend ($env.HOME | path join '.cargo/bin'))
let-env PATH = ($env.PATH | split row (char esep) | prepend ($env.HOME | path join '.local/software/miniconda3/condabin'))
let-env PATH = ($env.PATH | split row (char esep) | prepend ($env.HOME | path join 'SDK/flutter/bin'))
let-env PATH = ($env.PATH | split row (char esep) | prepend ($env.HOME | path join '.local/software/Xilinx/Vivado/2022.2/bin'))
let-env PATH = ($env.PATH | split row (char esep) | prepend ($env.HOME | path join '.local/bin'))
let-env CHROME_EXECUTABLE = "chromium"
let-env VULKAN_SDK = ($env.HOME | path join 'SDK/vulkan/1.3.239.0/x86_64')
let-env GPG_TTY = (tty)
let-env FZF_DEFAULT_COMMAND = "fd --type file --follow --color never --hidden --exclude .git"
let-env FZF_DEFAULT_OPTS = "--height 40% --layout=reverse --border"

source ~/.config/nushell/zoxide.nu
use ~/.config/nushell/nu_scripts/virtual_environments/conda.nu
