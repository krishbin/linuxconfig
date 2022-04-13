local keymaps = {}

local g = vim.g

local map = require('utils').map

function keymaps.set_leader()
  g.mapleader = ' '
  g.maplocalleader = ','
end

function keymaps.priority()
map('','Q','',{})
--close quickfix
map('n','Q',':cclose<CR>:lclose<CR>',{noremap=true,silent = true})
--change buffer
map('n',']b',':bn<cr>',{noremap=true,silent=true})
map('n','[b',':bp<cr>',{noremap=true,silent=true})
--indent lines of a file
map('n','<leader>ia','m`gg=G``',{noremap=true})
--clear highlighting
map('n','<leader>ch',':noh<CR>',{noremap=true,silent=true})
--long single line as multiline
map('n','j','gj',{noremap=true})
map('n','k','gk',{noremap=true})
--newtab
map('n','<leader>to',':<C-u>tabnew<cr>',{noremap=true})
--move tab position
map('n','<A-Left>',':-tabmove<cr>',{noremap=true,silent=true})
map('n','<A-Right>',':+tabmove<cr>',{noremap=true,silent=true})
--copy all of the file to clipboard
map('n','<leader>ya','m`gg0VG"*y``',{})
--delete the contents of file
map('n','<leader>da','gg0VGd',{})
--openvimrc
map('n','<leader>vi',':tabe ~/.config/nvim/lua/init.lua<cr>',{})
--sourcevimr
map('n','<leader>so',':source $MYVIMRC<cr>',{})

--select the text even after indentation
map('v','<','<gv',{noremap=true})
map('v','>','>gv',{noremap=true})
--yank to clipboard
map('v','<leader>y','"*y',{noremap=true,silent=true})
--split it up
map('','<leader>sh',':split<cr>',{})
map('','<leader>sv',':vsplit<cr>',{})
--savefile
map('n','<C-s>',':w<cr>',{})
map('i','<C-s>','<Esc>:w<cr>',{})
map('c','<C-a>','<Home>',{})
map('c','<C-b>','<Left>',{})
map('c','<C-f>','<Right>',{})
map('i','<C-b>','<Left>',{})
map('i','<C-f>','<Right>',{})
end

function keymaps.useful()
map('n','<F8>',':TagbarToggle<CR>',{noremap=true,silent=true})
--change vim windows
--map('n','<leader>h','<C-w>h',{noremap=true,nowait=true})
--map('n','<leader>j','<C-w>j',{noremap=true,nowait=true})
--map('n','<leader>k','<C-w>k',{noremap=true,nowait=true})
--map('n','<leader>l','<C-w>l',{noremap=true,nowait=true})
--maximize focused window
map('n','<leader>z',':wincmd _<cr>:wincmd \\|<cr>',{noremap=true})
--minimize focused window
map('n','<leader>Z',':wincmd =<cr>',{noremap=true})
  --move a visual block up or down a line
map('v','<leader>k',':move-2<CR>gv=gv',{noremap=true,silent=true})
map('v','<leader>j',':move\'>+<CR>gv=gv',{noremap=true,silent=true})
--add a space below or above the line and come back to the position
map('n','<leader>aj','m`o<esc>``',{noremap=true,silent=true})
map('n','<leader>ak','m`o<esc>``',{noremap=true,silent=true})
--select with leader and key to change tab
map('n','<leader>1','1gt',{noremap=true})
map('n','<leader>2','2gt',{noremap=true})
map('n','<leader>3','3gt',{noremap=true})
map('n','<leader>4','4gt',{noremap=true})
map('n','<leader>5','5gt',{noremap=true})
map('n','<leader>6','6gt',{noremap=true})
map('n','<leader>7','7gt',{noremap=true})
map('n','<leader>8','8gt',{noremap=true})
map('n','<leader>9','9gt',{noremap=true})
end

function keymaps.tinkering()
map('n','<leader>co',':silent !tmux send-keys -t 1 "./proj.sh configure" "C-m"<cr>',{})
map('n','<leader>cc',':silent !tmux send-keys -t 1 "./proj.sh build" "C-m"<cr>',{})
map('n','<leader>cs',':silent !tmux send-keys -t 1 "./proj.sh shader" "C-m"<cr>',{})
map('n','<leader>rr',':silent !tmux send-keys -t 1 "./proj.sh run" "C-m"<cr>',{})
end


function git_files_fallback()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end

function keymaps.telescope()
map('n','<leader>tl',":lua require('telescope.builtin').lsp_references{ shorten_path = true }<CR>",{noremap=true,silent=true})
map('n','<leader>tg',":lua require('telescope.builtin').live_grep()<cr>",{noremap=true,silent=true})
map('n','<leader>tq',":lua require('telescope.builtin').quickfix()<cr>",{noremap=true,silent=true})
map('n','<leader><c-p>',":lua require('telescope.builtin').git_files{}<CR>",{noremap=true,silent=true})
map('n','<c-p>',":lua git_files_fallback()<CR>",{noremap=true,silent=true})
map('n',',<c-p>',":lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ winblend = 20 }))<CR>",{noremap=true,silent=true})
map("n", "<Leader>tt", ":lua require('telescope.builtin').treesitter{}<CR>", {silent = true})
map("n", "<Leader>tb", ":lua require('telescope.builtin').buffers{}<CR>", {silent = true})
end

return keymaps
