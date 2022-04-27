local keymaps = {}

local g = vim.g
local kmap = vim.keymap.set

function keymaps.set_leader()
  g.mapleader = ' '
  g.maplocalleader = ','
end

function keymaps.priority()
kmap('','Q','',{})
--close quickfix
kmap('n','Q',':cclose<CR>:lclose<CR>',{noremap=true,silent = true})
--change buffer
kmap('n',']b',':bn<cr>',{noremap=true,silent=true})
kmap('n','[b',':bp<cr>',{noremap=true,silent=true})
--indent lines of a file
kmap('n','<leader>ia','m`gg=G``',{noremap=true})
--clear highlighting
kmap('n','<leader>ch',':noh<CR>',{noremap=true,silent=true})
--long single line as multiline
kmap('n','j','gj',{noremap=true})
kmap('n','k','gk',{noremap=true})
--newtab
kmap('n','<leader>to',':<C-u>tabnew<cr>',{noremap=true})
--move tab position
kmap('n','<A-Left>',':-tabmove<cr>',{noremap=true,silent=true})
kmap('n','<A-Right>',':+tabmove<cr>',{noremap=true,silent=true})
--copy all of the file to clipboard
kmap('n','<leader>ya','m`gg0VG"*y``',{})
--delete the contents of file
kmap('n','<leader>da','gg0VGd',{})
--openvimrc
kmap('n','<leader>vi',':tabe ~/.config/nvim/lua/init.lua<cr>',{})
--sourcevimr
kmap('n','<leader>so',':source $MYVIMRC<cr>',{})

--select the text even after indentation
kmap('v','<','<gv',{noremap=true})
kmap('v','>','>gv',{noremap=true})
--yank to clipboard
kmap('v','<leader>y','"*y',{noremap=true,silent=true})
--split it up
kmap('','<leader>sh',':split<cr>',{})
kmap('','<leader>sv',':vsplit<cr>',{})
--savefile
kmap('n','<C-s>',':w<cr>',{})
kmap('i','<C-s>','<Esc>:w<cr>',{})
kmap('c','<C-a>','<Home>',{})
kmap('c','<C-b>','<Left>',{})
kmap('c','<C-f>','<Right>',{})
kmap('i','<C-b>','<Left>',{})
kmap('i','<C-f>','<Right>',{})
end

function keymaps.useful()
kmap('n','<F8>',':TagbarToggle<CR>',{noremap=true,silent=true})
--maximize focused window
kmap('n','<leader>z',':wincmd _<cr>:wincmd \\|<cr>',{noremap=true})
--minimize focused window
kmap('n','<leader>Z',':wincmd =<cr>',{noremap=true})
--move a visual block up or down a line
kmap('v','<leader>k',':move-2<CR>gv=gv',{noremap=true,silent=true})
kmap('v','<leader>j',':move\'>+<CR>gv=gv',{noremap=true,silent=true})
--add a space below or above the line and come back to the position
kmap('n','<leader>aj','m`o<esc>``',{noremap=true,silent=true})
kmap('n','<leader>ak','m`o<esc>``',{noremap=true,silent=true})
--select with leader and key to change tab
for i=1,9,1 do
    kmap({'n'},'<leader>'..tostring(i),tostring(i)..'gt',{noremap=true})
end
kmap('n','<leader>ss',':source $HOME/.config/nvim/lua/lsp_lua/snippets.lua<cr>',{noremap=true,silent=true})
end

function keymaps.tinkering()
kmap('n','<leader>co',':silent !tmux send-keys -t 1 "./proj.sh configure" "C-m"<cr>',{})
kmap('n','<leader>cc',':silent !tmux send-keys -t 1 "./proj.sh build" "C-m"<cr>',{})
kmap('n','<leader>cs',':silent !tmux send-keys -t 1 "./proj.sh shader" "C-m"<cr>',{})
kmap('n','<leader>rr',':silent !tmux send-keys -t 1 "./proj.sh run" "C-m"<cr>',{})
end


function git_files_fallback()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end

function keymaps.telescope()
  kmap('n','<leader>tl',function()
    require('telescope.builtin').lsp_references{ shorten_path = true }
  end,{noremap=true,silent=true})
  kmap('n','<leader>tg',function()
    require('telescope.builtin').live_grep()
  end,{noremap=true,silent=true})
  kmap('n','<leader>tq',function()
    require('telescope.builtin').quickfix()
  end,{noremap=true,silent=true})
  kmap('n','<leader><c-p>',function()
    require('telescope.builtin').git_files{}
  end,{noremap=true,silent=true})
  kmap('n','<c-p>',function()
    git_files_fallback()
  end,{noremap=true,silent=true})
  kmap('n',',<c-p>',function()
  require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ winblend = 20 }))
  end,{noremap=true,silent=true})
  kmap("n", "<Leader>tt",function()
    require('telescope.builtin').treesitter{}
  end, {silent = true})
  kmap("n", "<Leader>tb",function()
    require('telescope.builtin').buffers{}
  end, {silent = true})
end

return keymaps
