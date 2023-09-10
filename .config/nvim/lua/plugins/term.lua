return {
    {
        "akinsho/toggleterm.nvim",
        event = 'VeryLazy',
        version = "*",
        opts = {
            size = function(term)
                if term.direction == 'horizontal' then
                    return 15
                elseif term.direction == 'vertical' then
                    return math.floor(vim.o.columns * 0.4)
                end
            end,
            open_mapping = [[<c-\>]],
        },
        config = function(_, opts)
            require('toggleterm').setup(opts)

            local Terminal = require('toggleterm.terminal').Terminal

        end

    },
}
