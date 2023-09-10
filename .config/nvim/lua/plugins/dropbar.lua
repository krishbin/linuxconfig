return {
    {
        "Bekaboo/dropbar.nvim",
        keys = {
            { '<leader>wp', function() require('dropbar.api').pick() end, desc = 'winbar: pick' },
        } ,
        opts={

        },
    }
}
