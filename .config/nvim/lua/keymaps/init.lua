local keymaps = {}
local core = require'keymaps.core'
local syscom = require'keymaps.syscom'
local fancy = require'keymaps.fancy'

function keymaps.setup()
    core.set_leader()
    core.setup()
    fancy.setup()
    syscom.setup()
end

return keymaps