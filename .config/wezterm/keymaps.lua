local wezterm = require 'wezterm';
return {
    -- tab and pane management
    {
        key = 'c',
        mods = 'LEADER',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    {
        key = 'C',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SpawnTab 'DefaultDomain',
    },
    {
        key = '|',
        mods = 'LEADER|SHIFT',
        action = wezterm.action.SplitHorizontal {
            domain = 'CurrentPaneDomain',
        },
    },
    {
        key = '-',
        mods = 'LEADER',
        action = wezterm.action.SplitVertical {
            domain = 'CurrentPaneDomain',
        },
    },
    -- tab and pane navigation
    {
        key = 'n',
        mods = 'LEADER',
        action = wezterm.action.ActivateTabRelative(1),
    },
    {
        key = 'p',
        mods = 'LEADER',
        action = wezterm.action.ActivateTabRelative(-1),
    },
    {
        key = 'l',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'h',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'j',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'k',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'a',
        mods = 'LEADER|CTRL',
        action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
    },
    -- session controls
    {
        key = 'r',
        mods = 'LEADER',
        action = wezterm.action.ReloadConfiguration,
    },
    -- toggle fullscreen
    {
        key = 'F11',
        action = wezterm.action.ToggleFullScreen,
    },
    -- search
    {
        key = '/',
        mods = 'LEADER',
        action = wezterm.action.Search("CurrentSelectionOrEmptyString"),
    },
    -- close current window
    {
        key = 'q',
        mods = 'SUPER',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    -- activate launcher menu
    {
        key = '\\',
        mods = 'LEADER',
        action = wezterm.action.ShowLauncher,
    },
    {
        key = '9',
        mods = 'ALT',
        action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|TABS' },
    },
    { 
        key = 'F9', 
        mods = 'ALT', 
        action = wezterm.action.ShowTabNavigator 
    },


}
