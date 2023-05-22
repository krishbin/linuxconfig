return {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup {
                position = "bottom", -- position of the list can be: bottom, top, left, right
                icons = true, -- use devicons for filenames
                fold_open = "", -- icon used for open folds
                fold_closed = "", -- icon used for closed folds
                group = true, -- group results by file
                padding = true, -- add an extra new line on top of the list
                action_keys = { -- key mappings for actions in the trouble list
                    -- map to {} to remove a mapping, for example:
                    -- close = {},
                    close = "q", -- close the list
                    cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                    refresh = "r", -- manually refresh
                    jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
                    open_split = { "<c-x>" }, -- open buffer in new split
                    open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                    open_tab = { "<c-t>" }, -- open buffer in new tab
                    jump_close = {"o"}, -- jump to the diagnostic and close the list
                    toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                    toggle_preview = "P", -- toggle auto_preview
                    hover = "K", -- opens a small popup with the full multiline message
                    preview = "p", -- preview the diagnostic location
                    close_folds = {"zM", "zm"}, -- close all folds
                    open_folds = {"zR", "zr"}, -- open all folds
                    toggle_fold = {"zA", "za"}, -- toggle fold of current file
                    previous = "k", -- previous item
                    next = "j" -- next item
                },
                indent_lines = true, -- add an indent guide below the fold icons
                auto_open = false, -- automatically open the list when you have diagnostics
                auto_close = true, -- automatically close the list when you have no diagnostics
                auto_preview = false, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
                auto_fold = false, -- automatically fold a file trouble list at creation
                signs = {
                    -- icons / text used for a diagnostic
                    error = "",
                    warning = "",
                    hint = "",
                    information = "",
                    other = "﫠"
                },
                use_diagnostic_signs = true
            }
        end,
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle<cr>"},
            { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>"},
            { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>"},
            { "<leader>xl", "<cmd>TroubleToggle loclist<cr>"},
            { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>"},
            { "gR", "<cmd>TroubleToggle lsp_references<cr>"},
        },
    },
}
