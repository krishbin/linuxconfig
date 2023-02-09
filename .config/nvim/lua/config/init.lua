local config = {}

local colorscheme = require('config.colorscheme')
local options = require('config.vimoptions')
local pluginoptions = require('config.pluginoptions')

function config.setup()
  colorscheme.setup()
  options.setup()
  pluginoptions.setup()
end

return config
