return {
    {
        "NeogitOrg/neogit",
        event = "VeryLazy",
        keys = {
            {
                '<leader>gg',
                function() require('neogit').open() end,
                desc = 'Neogit: open'
            },
            {
                '<leader>gc',
                function() require('neogit').open({"commit"}) end,
                desc = 'Neogit: open'
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = true
    },
}
