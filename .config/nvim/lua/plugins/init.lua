return {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',

    'tpope/vim-surround',
    'tpope/vim-fugitive',

    'preservim/tagbar',
    { "lukas-reineke/indent-blankline.nvim" },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {

        }
    },
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
}
