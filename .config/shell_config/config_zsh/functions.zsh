#enable autocd
set -o AUTO_CD

#enable autocorrect
set -o CORRECT
# No arguments: `git status`
# With arguments: acts like `git`
g() {
    if [[ $# -gt 0 ]]; then
        git "$@"
    else
        git status
    fi
}

cg() {
    if [[ $# -gt 0 ]]; then
        config "$@"
    else
        config status
    fi
}

#makedir and change into it
function mcd() {
    mkdir -p "$1" && cd "$1";
}


function srcros() {
    if [[ -f /opt/ros/humble/setup.zsh ]]; then
        source /opt/ros/humble/setup.zsh
        PROMPT="%{$fg[green]%}[ROS2]%{$reset_color%} $PROMPT"
    else
        echo "No ROS2 sourced"
    fi
}

# lazy load ros2
function ros2() {
    if [[ -f /opt/ros/humble/setup.zsh ]]; then
        unfunction ros2
        source /opt/ros/humble/setup.zsh
        PROMPT="%{$fg[green]%}[ROS2]%{$reset_color%} $PROMPT"
        ros2 "$@"
    else
        echo "No ROS2 sourced"
    fi
}
