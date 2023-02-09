local fancy = {}
local map = require('utils').map

function fancy.setup()
    map('n', '<F8>', ':TagbarToggle<CR>', { noremap = true, silent = true })
    --maximize focused window
    map('n', '<leader>z', ':wincmd _<cr>:wincmd \\|<cr>', { noremap = true })
    --minimize focused window
    map('n', '<leader>Z', ':wincmd =<cr>', { noremap = true })
    --move a visual block up or down a line
    map('v', '<leader>k', ':move-2<CR>gv=gv', { noremap = true, silent = true })
    map('v', '<leader>j', ':move\'>+<CR>gv=gv', { noremap = true, silent = true })
    --add a space below or above the line and come back to the position
    map('n', '<leader>aj', 'm`o<esc>``', { noremap = true, silent = true })
    map('n', '<leader>ak', 'm`o<esc>``', { noremap = true, silent = true })
    --select with leader and key to change tab
    -- for i = 1, 9, 1 do
    --     map({ 'n' }, '<leader>' .. tostring(i), tostring(i) .. 'gt', { noremap = true })
    -- end
    map('n', '<leader>ss', ':source $HOME/.config/nvim/lua/lsp_lua/snippets.lua<cr>', { noremap = true, silent = true })
end

return fancy
