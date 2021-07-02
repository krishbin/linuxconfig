local nvimtree={}
local map = require('utils').map
local g = vim.g

function nvimtree.setup()
  g.lua_tree_side = 'left'
  g.lua_tree_width = 30
  g.lua_tree_ignore = { '.git', 'node_modules', '.cache' }
  g.lua_tree_auto_open = 1
  g.lua_tree_auto_close = 1
  g.lua_tree_quit_on_open = 0
  g.lua_tree_follow = 1
  g.lua_tree_indent_markers = 1
  g.lua_tree_hide_dotfiles = 1
  g.lua_tree_git_hl = 1
  g.lua_tree_show_icons = {
    git= 1,
    folders= 1,
    files= 1
  }
  g.nvim_tree_icons = {
    default= '',
    symlink= '',
    git= {
      unstaged= "✗",
      staged= "✓",
      unmerged= "",
      renamed= "➜",
      untracked= "★",
      deleted= "",
      ignored= "◌"
    },
    folder= {
      arrow_open= "",
      arrow_closed= "",
      default= "",
      open= "",
      empty= "",
      empty_open= "",
      symlink= "",
      symlink_open= ""
    },
    lsp= {
      hint= "",
      info= "",
      warning= "",
      error= ""
    }
  }
  map('n','<leader>o',':NvimTreeToggle<cr>',{noremap=true})
  map('n','<leader>r',':NvimTreeRefresh<cr>',{noremap=true})
  map('n','<leader>n',':NvimTreeFindFile<CR>',{noremap=true})
end

return nvimtree
