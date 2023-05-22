local vopt = {}

local o = vim.o
local wo = vim.wo

function vopt.setup()
    o.updatetime = 400
    o.foldlevelstart = 99
    o.termguicolors = true
    o.ignorecase = true -- Ignore case
    o.confirm = true -- Disable 'no write'
    o.scrolloff = 4 -- Lines from the cursor
    o.incsearch = true -- Move cursor during search
    o.splitright = true -- Splits open on the right
    o.splitbelow = true -- Splits open on the bottom
    o.wildmenu = true -- Command line completion mode
    o.wildmode = 'full' -- Command line completion mode
    o.hlsearch = true -- Highlight search results (enforce)
    o.showmatch = true -- Show matching brackets/parenthesis
    o.showmode = false -- Do not output message on the bottom
    o.inccommand = 'split' -- Show effects of command as you type in a split
    o.tabstop = 4 -- Tabs are 4 spaces long BO
    o.shiftwidth = 4 -- Number of space for autoindent BO
    o.expandtab = true -- expand tab into space by default
    o.shortmess = vim.o.shortmess .. 'c'
    o.smartindent = true -- auto indent on new line (brackets for instance) BO
    o.textwidth = 80
    o.pumheight = 20
    o.formatoptions = o.formatoptions:gsub('[cro]', '')
    o.colorcolumn = '100'
    o.completeopt = "menuone,noselect"
    o.linebreak = true
    o.foldmethod='expr'
    o.foldexpr='nvim_treesitter#foldexpr()'
    o.clipboard='unnamedplus'
    o.background='dark'
    o.loaded_node_provider = 0
    o.loaded_perl_provider = 0
    vim.opt.conceallevel = 2
    vim.opt.concealcursor = 'nc'
    wo.number=true
    wo.relativenumber=true
    wo.cursorline=true
end

return vopt
