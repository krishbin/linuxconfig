if [[ -f $HOME/.cargo/env ]];
then
. "$HOME/.cargo/env"
fi

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1
fi
