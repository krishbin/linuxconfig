return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        config = function()
            require('telescope').setup {
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--trim"
                    },
                    mappings = {
                        n = {
                            ["<M-p>"] = require('telescope.actions.layout').toggle_preview
                        },
                        i = {
                            ["<M-w>"] = require('telescope.actions').close,
                            ["<M-p>"] = require('telescope.actions.layout').toggle_preview
                        },
                    },
                }
            }
        end,
        keys = {
            {
                "<leader>tl",
                function()
                    require('telescope.builtin').lsp_references { shorten_path = true }
                end
            },
            {
                "<leader>tg",
                function()
                    require('telescope.builtin').live_grep()
                end
            },
            {
                "<leader>tq",
                function()
                    require('telescope.builtin').quickfix()
                end
            },
            {
                "<leader><c-p>",
                function()
                    require('telescope.builtin').git_files {}
                end
            },
            {
                "<C-p>",
                function()
                    local opts = {} -- define here if you want to define something
                    local ok = pcall(require "telescope.builtin".git_files, opts)
                    if not ok then require "telescope.builtin".find_files(opts) end
                end
            },
            {
                ",<C-p>",
                function()
                    require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ winblend = 19 }))
                end
            },
            {
                "<Leader>tt",
                function()
                    require('telescope.builtin').treesitter {}
                end
            },
            {
                "<Leader>tb",
                function()
                    require('telescope.builtin').buffers {}
                end
            }
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim"
        }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    {
        'romgrk/nvim-treesitter-context',
    }
}
