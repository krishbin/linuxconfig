local config = {}

local colorscheme = require('config.colorscheme')
local options = require('config.vimoptions')
local nvimtree = require('config.nvimtree')
local pluginoptions = require('config.pluginoptions')
local statusline = require('config.statusline')
local telescope = require('config.telescope')

function config.setup()
  colorscheme.setup()
  options.setup()
  pluginoptions.setup()
  nvimtree.setup()
  statusline.setup()
  telescope.setup()
end

return config
