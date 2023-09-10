return {
    {
        "folke/zen-mode.nvim",
        event = "VeryLazy",
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
            kitty = {
                enabled = true,
                font = "+2"
            }
        },
    },
}
