vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use {'wbthomason/packer.nvim', opt = true}
  use {'mhinz/vim-startify'}
  use {'romgrk/nvim-treesitter-context'}
  use {'mhinz/vim-signify'}
  use {'christoomey/vim-tmux-navigator'}
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'jiangmiao/auto-pairs'
  use {'pangloss/vim-javascript',ft = {'js'}}
  use {'preservim/tagbar'}
  use {'L3MON4D3/LuaSnip'}
  use {'saadparwaiz1/cmp_luasnip'}
  use {'sainnhe/gruvbox-material'}
  use {'shaunsingh/nord.nvim'}
  use {'nvim-lualine/lualine.nvim'}
  use {'nvim-telescope/telescope-packer.nvim'}
  use {'tikhomirov/vim-glsl'}
  use {'nvim-orgmode/orgmode'}
  use {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp'
  }
  use {'numToStr/Comment.nvim'}
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'kyazdani42/nvim-web-devicons',
    config=function()
      require'nvim-web-devicons'.setup {
        default = true;
      }
    end
  }
  use {'kyazdani42/nvim-tree.lua'}
  use {'nvim-treesitter/nvim-treesitter'}
  use {'lervag/vimtex',ft = {'tex'} }
end)
