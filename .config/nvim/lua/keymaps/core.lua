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
    map('n', ']b', ':bn<cr>', { noremap = true, silent = true })
    map('n', '[b', ':bp<cr>', { noremap = true, silent = true })
    --indent lines of a file
    map('n', '<leader>ia', 'm`gg=G``', { noremap = true })
    --clear highlighting
    map('n', '<leader>ch', ':noh<CR>', { noremap = true, silent = true })
    --long single line as multiline
    map('n', 'j', 'gj', { noremap = true })
    map('n', 'k', 'gk', { noremap = true })
    --newtab
    map('n', '<leader>to', ':<C-u>tabnew<cr>', { noremap = true })
    --move tab position
    map('n', '<A-Left>', ':-tabmove<cr>', { noremap = true, silent = true })
    map('n', '<A-Right>', ':+tabmove<cr>', { noremap = true, silent = true })
    --copy all of the file to clipboard
    map('n', '<leader>ya', 'm`gg0VG"*y``', {})
    --delete the contents of file
    map('n', '<leader>da', 'gg0VGd', {})
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
    map('v', '<', '<gv', { noremap = true })
    map('v', '>', '>gv', { noremap = true })
    --yank to clipboard
    map('v', '<leader>y', '"*y', { noremap = true, silent = true })
    --split it up
    map('', '<leader>s-', ':split<cr>', {})
    map('', '<leader>s|', ':vsplit<cr>', {})
    --savefile
    map('n', '<C-s>', ':w<cr>', {})
    map('i', '<C-s>', '<Esc>:w<cr>', {})
    map('c', '<C-a>', '<Home>', {})
    map('c', '<C-b>', '<Left>', {})
    map('c', '<C-f>', '<Right>', {})
    map('i', '<C-b>', '<Left>', {})
    map('i', '<C-f>', '<Right>', {})
end

return corekeymap
