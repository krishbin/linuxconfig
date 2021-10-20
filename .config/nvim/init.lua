local keymaps = require'keymappings'
keymaps.set_leader()
require'config'.setup()
require'plugins'
keymaps.priority()
keymaps.telescope()
require'autocommands'.setup()
keymaps.useful()
require'lsp_lua'.setup()
