return {
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            options = {
                icons_enabled = true,
                theme = 'solarized_light',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {},
                always_divide_middle = true,
                globalstatus = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff' },
                lualine_c = {
                    {
                        'filename',
                        path = 1
                    }
                },
                lualine_x = { 'encoding', 'fileformat', 'filetype', 'diagnostics' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = { 'quickfix', 'nvim-tree' }
        },
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        }
    },
}
