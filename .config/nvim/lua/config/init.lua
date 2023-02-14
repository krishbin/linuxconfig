local config = {}
local options = require('config.vimoptions')
local pluginoptions = require('config.pluginoptions')

function config.setup()
  options.setup()
  pluginoptions.setup()
end

return config
