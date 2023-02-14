return {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',

    'tpope/vim-surround',
    'tpope/vim-fugitive',
    'jiangmiao/auto-pairs',

    'preservim/tagbar',
    'github/copilot.vim',

    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    },

    {
        'nvim-tree/nvim-web-devicons',
        config = function()
          require 'nvim-web-devicons'.setup {
              default = true,
          }
        end
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup {
                buftype_exclude = { 'terminal' },
                filetype_exclude = { 'help', 'packer','alpha'},
                show_end_of_line = true,
                show_current_context = true,
                context_patterns = {
                    'class', 'function', 'method', '^if', '^while', '^for', '^object', '^table',
                    'block', 'arguments', 'if_statement', 'else_clause', 'jsx_element',
                    'jsx_self_closing_element', 'try_statement', 'catch_clause', 'import_statement',
                    'operation_type'
                }
            }
        end
    }
}
