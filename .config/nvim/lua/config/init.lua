local config = {}
local options = require('config.vimoptions')
local pluginoptions = require('config.pluginoptions')
local colors = require('config.colors')

function config.setup()
    options.setup()
    pluginoptions.setup()
    colors.set()
end

return config
