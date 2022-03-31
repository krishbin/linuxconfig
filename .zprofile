if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  [[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1 &> /dev/null
  #[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startplasma-wayland &> /dev/null
fi
