local M = {}

-- Base16 Solarized Dark
local cshm = {
    base03  = '#002b36',
    base02  = '#073642',
    base01  = '#586e75',
    base00  = '#657b83',
    base0   = '#839496',
    base1   = '#93a1a1',
    base2   = '#eee8d5',
    base3   = '#fdf6e3',
    yellow  = '#b58900',
    orange  = '#cb4b16',
    red     = '#dc322f',
    magenta = '#d33682',
    violet  = '#6c71c4',
    blue    = '#268bd2',
    cyan    = '#2aa198',
    green   = '#719e07'
}

M.colors = {
    -- The default text color
    foreground = cshm.base03,
    -- The default background color
    background = cshm.base3,

    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    cursor_bg = cshm.yellow,
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = cshm.base03,
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = cshm.base01,

    -- the foreground color of selected text
    selection_fg = cshm.base03,
    -- the background color of selected text
    selection_bg = cshm.base1,

    -- The color of the scrollbar "thumb"; the portion that represents the current viewport
    scrollbar_thumb = cshm.base1,

    -- The color of the split lines between panes
    split = cshm.base02,

    ansi = {
        -- Normal Colors
        cshm.base02, -- black
        cshm.red, -- red
        cshm.green, -- green
        cshm.yellow, -- yellow
        cshm.blue, -- blue
        cshm.magenta, -- magenta
        cshm.cyan, -- cyan
        cshm.base2, -- white
    },
    brights = {
        -- Bright Colors
        cshm.base02, -- black
        cshm.red, -- red
        cshm.green, -- green
        cshm.yellow, -- yellow
        cshm.blue, -- blue
        cshm.magenta, -- magenta
        cshm.cyan, -- cyan
        cshm.base2, -- white
    },

    -- Arbitrary colors of the palette in the range from 16 to 255
    indexed = { [136] = '#af8700' },

    -- Since: 20220319-142410-0fcdea07
    -- When the IME, a dead key or a leader key are being processed and are effectively
    -- holding input pending the result of input composition, change the cursor
    -- to this color to give a visual cue about the compose state.
    compose_cursor = cshm.orange,

    -- Colors for copy_mode and quick_select
    -- available since: 20220807-113146-c2fee766
    -- In copy_mode, the color of the active text is:
    -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
    -- 2. selection_* otherwise
    copy_mode_active_highlight_bg = { Color = '#000000' },
    -- use `AnsiColor` to specify one of the ansi color palette values
    -- (index 0-15) using one of the names "Black", "Maroon", "Green",
    --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
    -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
    copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
    copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
    copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

    quick_select_label_bg = { Color = 'peru' },
    quick_select_label_fg = { Color = '#ffffff' },
    quick_select_match_bg = { AnsiColor = 'Navy' },
    quick_select_match_fg = { Color = '#ffffff' },
}

return M
