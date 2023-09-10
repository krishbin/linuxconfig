local map = require('utils').map
return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        event = 'UIEnter',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local bufferline = require('bufferline')
            bufferline.setup({
                options = {
                    debug = { logging = true },
                    mode = 'buffers',
                    sort_by = 'insert_after_current',
                    move_wraps_at_ends = true,
                    right_mouse_command = 'vert sbuffer %d',
                    show_close_icon = false,
                    show_buffer_close_icons = true,
                    indicator = { style = 'underline' },
                    diagnostics = 'nvim_lsp',
                    diagnostics_indicator = function(count, level)
                        level = level:match('warn') and 'warn' or level
                        return (icons[level] or '?') .. ' ' .. count
                    end,
                    diagnostics_update_in_insert = false,
                    hover = { enabled = true, reveal = { 'close' } },
                    offsets = {
                        {
                            text = 'EXPLORER',
                            filetype = 'NvimTree',
                            highlight = 'PanelHeading',
                            text_align = 'left',
                            separator = true,
                        },
                        {
                            text = ' FLUTTER OUTLINE',
                            filetype = 'flutterToolsOutline',
                            highlight = 'PanelHeading',
                            separator = true,
                        },
                    },
                },
            })

            map('n', '[b', '<Cmd>BufferLineMoveNext<CR>', { desc = 'bufferline: move next' })
            map('n', ']b', '<Cmd>BufferLineMovePrev<CR>', { desc = 'bufferline: move prev' })
            map('n', 'gbb', '<Cmd>BufferLinePick<CR>', { desc = 'bufferline: pick buffer' })
            map('n', 'gbd', '<Cmd>BufferLinePickClose<CR>', { desc = 'bufferline: delete buffer' })
            map('n', '<S-tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'bufferline: prev' })
            map('n', '<leader><tab>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'bufferline: next' })
        end,
    },
}
