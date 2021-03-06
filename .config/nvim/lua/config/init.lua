local config = {}

local colorscheme = require('config.colorscheme')
local options = require('config.vimoptions')
local nvimtree = require('config.nvimtree')
local pluginoptions = require('config.pluginoptions')
local lualine = require('config.lualine')
local telescope = require('config.telescope')
local comment = require('config.comment')

function config.setup()
  colorscheme.setup()
  options.setup()
  pluginoptions.setup()
  telescope.setup()
  nvimtree.setup()
  lualine.setup()
  comment.setup()
  require('telescope').load_extension('fzf')
end

return config
