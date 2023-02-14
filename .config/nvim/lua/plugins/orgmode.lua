return {
    {
        "nvim-orgmode/orgmode",
        ft = { 'org' },
        config = function()
            require('orgmode').setup_ts_grammar()

            -- Treesitter configuration
            require('nvim-treesitter.configs').setup {
                -- If TS highlights are not enabled at all, or disabled via `disable` prop,
                -- highlighting will fallback to default Vim syntax highlighting
                highlight = {
                    enable = true,
                    -- Required for spellcheck, some LaTex highlights and
                    -- code block highlights that do not have ts grammar
                    additional_vim_regex_highlighting = { 'org' },
                },
                ensure_installed = { 'org' }, -- Or run :TSUpdate org
            }

            require('orgmode').setup({
                org_agenda_files = { '~/orgs/**/*' },
                org_default_notes_file = '~/orgs/refile.org',
            })
        end
    },
    {
        'lukas-reineke/headlines.nvim',
        ft = { 'org' },
        config = function()
            require('headlines').setup()
        end,
        dependencies = {
            'nvim-orgmode/orgmode',
        }
    },
    {
        'akinsho/org-bullets.nvim',
        ft = { 'org' },
        config = function()
            require('org-bullets').setup()
        end,
        dependencies = {
            'nvim-orgmode/orgmode',
        }
    },
    {
        'dhruvasagar/vim-table-mode',
        ft = { 'org', 'markdown' },
        config = function()
            vim.g.table_mode_corner_corner = '+'
            vim.g.table_mode_header_fillchar = '-'
            vim.g.table_mode_header_corner = '+'
            vim.g.table_mode_header_hline = '-'
            vim.g.table_mode_header_vline = '|'
            vim.g.table_mode_vline = '|'
            vim.g.table_mode_corner_hline = '-'
            vim.g.table_mode_corner_vline = '|'
            vim.g.table_mode_corner_corner = '+'
        end
    }
}
