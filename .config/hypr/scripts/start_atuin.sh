#check if a file exists 
if [ -f $HOME/.local/share/atuin/atuin.sock ]; then
    rm $HOME/.local/share/atuin/atuin.sock && atuin daemon &
else
    atuin daemon &
fi
