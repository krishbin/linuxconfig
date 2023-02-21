local wezterm = require 'wezterm';

local default_prog = { "/home/krishbin/.cargo/bin/nu"}

return {
    font = wezterm.font("JetBrainsMono Nerd Font"),
    font_size = 12.0,
    color_scheme = "Catppuccin Mocha",
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    hide_tab_bar_if_only_one_tab = true,
    check_for_updates = false,
    enable_scroll_bar = false,
    default_prog = default_prog,
    window_close_confirmation = "AlwaysPrompt",
    leader = { key = "q", mods = "CTRL" },
    keys = require"keymaps",
}
