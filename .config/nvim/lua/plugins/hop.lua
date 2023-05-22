return {
    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            vim.api.nvim_set_keymap('n', '<leader>h', "<cmd>lua require'hop'.hint_words()<cr>", {})
            vim.api.nvim_set_keymap('n', '<leader>H', "<cmd>lua require'hop'.hint_lines()<cr>", {})
            vim.api.nvim_set_keymap('n', '<leader>l', "<cmd>lua require'hop'.hint_lines_skip_whitespace()<cr>", {})
            vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
            vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
            vim.api.nvim_set_keymap('n', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true }, hint_offset = -1)<cr>", {})
            vim.api.nvim_set_keymap('n', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})
        end,
    },
}

