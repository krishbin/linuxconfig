local map = require('utils').map
local api = vim.api
return {
    {
        'rcarriga/nvim-notify',
        config = function()
            local notify = require('notify')
            notify.setup({
                timeout = 5000,
                stages = 'fade_in_slide_out',
                top_down = false,
                background_colour = '#000000',
                max_width = function() return math.floor(vim.o.columns * 0.6) end,
                max_height = function() return math.floor(vim.o.lines * 0.8) end,
                on_open = function(win)
                    if not api.nvim_win_is_valid(win) then return end
                    api.nvim_win_set_config(win, { border = border })
                end,
            })
            map('n', '<leader>nd', function() notify.dismiss({ silent = true, pending = true }) end, {
                desc = 'dismiss notifications',
            })
        end,
    },
}
