return {
    {
        "akinsho/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim',
        },
        config = function()
            require("flutter-tools").setup({
                flutter_path = "/home/krishbin/SDK/flutter/bin/flutter",
                widget_guides = {
                    enabled = true,
                },
                closing_tags = {
                    highlight = "ErrorMsg",
                    prefix = "▾ ",
                    enabled = true,
                },
                dev_log = {
                    open_cmd = "tabedit",
                },
                lsp = {
                    on_attach = function(client, bufnr)
                        require("lsp").common_on_attach(client, bufnr)
                        require("lsp-status").on_attach(client)
                    end,
                },
            })
        end,
    },
}
