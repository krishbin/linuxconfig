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

  use {
    'pangloss/vim-javascript',
    ft = {'js'}
  }

  use 'preservim/tagbar'

  use {'sainnhe/gruvbox-material'}
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      -- Options (see available options below)
      vim.g.rose_pine_variant = 'base'
      vim.g.rose_pine_colors = {
        punctuation = '#fa8072',
        comment = '#ffffff',
        hint = '#9745be',
        info = '#78ccc5',
        warn = '#f5c359',
        error = '#c75c6a',
      }

    end
  })


  use {'tikhomirov/vim-glsl'}

  use {
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-compe'
  }

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

  use 'itchyny/lightline.vim'

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {'kyazdani42/nvim-tree.lua'}

  use {'nvim-treesitter/nvim-treesitter'}

  use {'lervag/vimtex',
    ft = {'tex'}
  }

end)
