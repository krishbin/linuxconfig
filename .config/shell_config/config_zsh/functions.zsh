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
