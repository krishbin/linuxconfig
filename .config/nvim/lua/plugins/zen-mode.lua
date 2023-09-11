return {
    {
        "folke/zen-mode.nvim",
        lazy = true,
        keys = {
            {
                '<leader><F1>',
                function()
                    require("zen-mode").toggle({
                        window = {
                            width = .85
                        }
                    })
                end,
                desc = "Toggle Zen Mode"
            },
        },
        opts = {
            plugins = {

                options = {
                    enabled = true,
                    ruler = false, -- disables the ruler text in the cmd line area
                    showcmd = false, -- disables the command in the last line of the screen
                },
                wezterm = {
                    enabled = true,
                    font = "+0"
                },
            },
        },
    },
}
