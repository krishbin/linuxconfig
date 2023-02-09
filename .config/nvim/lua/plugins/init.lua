return {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',

    'mhinz/vim-signify',
    'tpope/vim-surround',
    'tpope/vim-commentary',
    'tpope/vim-fugitive',
    'jiangmiao/auto-pairs',

    'christoomey/vim-tmux-navigator',
    'preservim/tagbar',
    'shaunsingh/nord.nvim',
    'github/copilot.vim',

    {
        'nvim-tree/nvim-web-devicons',
        config = function()
          require 'nvim-web-devicons'.setup {
              default = true,
          }
        end
    },
}
