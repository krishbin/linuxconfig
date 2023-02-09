local syscom = {}
local map = require('utils').map

function syscom.setup()
    map('n', '<leader>co', ':silent !tmux send-keys -t 1 "./proj.sh configure" "C-m"<cr>', {})
    map('n', '<leader>cc', ':silent !tmux send-keys -t 1 "./proj.sh build" "C-m"<cr>', {})
    map('n', '<leader>cs', ':silent !tmux send-keys -t 1 "./proj.sh shader" "C-m"<cr>', {})
    map('n', '<leader>rr', ':silent !tmux send-keys -t 1 "./proj.sh run" "C-m"<cr>', {})
end

return syscom
