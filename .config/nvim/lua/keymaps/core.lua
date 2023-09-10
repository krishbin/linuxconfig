local corekeymap = {}
local map = require('utils').map
local g = vim.g

function corekeymap.set_leader()
  g.mapleader = ' '
  g.maplocalleader = ','
end

function corekeymap.setup()
    map('', 'Q', '', {})
    --close quickfix
    map('n', 'Q', ':cclose<CR>:lclose<CR>', { noremap = true, silent = true })
    --change buffer
    -- map('n', ']b', ':bn<cr>', { noremap = true, silent = true })
    -- map('n', '[b', ':bp<cr>', { noremap = true, silent = true })
    --indent lines of a file
    map('n', '<leader>ia', 'm`gg=G``', { noremap = true , silent = true  })
    --clear highlighting
    map('n', '<leader>ch', ':noh<CR>', { noremap = true, silent = true })
    --long single line as multiline
    map('n', 'j', 'gj', { noremap = true, silent = true })
    map('n', 'k', 'gk', { noremap = true, silent = true })
    --newtab
    map('n', '<leader>to', ':<C-u>tabnew<cr>', { noremap = true, silent = true })
    --move tab position
    map('n', '<A-Left>', ':-tabmove<cr>', { noremap = true, silent = true })
    map('n', '<A-Right>', ':+tabmove<cr>', { noremap = true, silent = true })
    --copy all of the file to clipboard
    map('n', '<leader>ya', 'm`gg0VG"*y``', { silent = true})
    --delete the contents of file
    map('n', '<leader>da', 'gg0VGd', { silent = true})
    --openvimrc
    map('n', '<leader>ni', ':tabe ~/.config/nvim/lua/init.lua<cr>', {})
    --sourcevimr
    map(
        'n',
        '<leader>ns',
        function()
            require('utils').reload_config()
        end,
        { noremap = true, silent = true}
    )

    --select the text even after indentation
    map('v', '<', '<gv', { noremap = true, silent = true })
    map('v', '>', '>gv', { noremap = true, silent = true })
    --yank to clipboard
    map('v', '<leader>y', '"*y', { noremap = true, silent = true })
    --split it up
    map('', '<leader>sx', ':split<cr>', {silent=true})
    map('', '<leader>sv', ':vsplit<cr>', {silent=true})
    --savefile
    map('n', '<C-s>', ':w<cr>', { silent = true })
    map('n', '<C-q>', ':bd<cr>', { noremap = true, silent = true})
    map('i', '<C-s>', '<Esc>:w<cr>', { silent = true })
    map('c', '<C-a>', '<Home>', { silent = true })
    map('c', '<C-b>', '<Left>', { silent = true })
    map('c', '<C-f>', '<Right>', { silent = true })
    map('i', '<C-b>', '<Left>', { silent = true })
    map('i', '<C-f>', '<Right>', { silent = true })
end

return corekeymap
