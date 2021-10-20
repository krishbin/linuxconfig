local nvimtree={}
local map = require('utils').map
local g = vim.g

function nvimtree.setup()
  require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = false,
    open_on_tab         = false,
    update_to_buf_dir   = {
      enable = true,
      auto_open = true,
    },
    hijack_cursor       = false,
    update_cwd          = false,
    diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file = {
      enable      = false,
      update_cwd  = false,
      ignore_list = {}
    },
    system_open = {
      cmd  = nil,
      args = {}
    },
    view = {
      width = 30,
      height = 30,
      side = 'left',
      auto_resize = false,
      mappings = {
        custom_only = false,
        list = {}
      }
    }
  }
  g.lua_tree_ignore = { '.git', 'node_modules', '.cache' }
  g.lua_tree_indent_markers = 1
  g.lua_tree_hide_dotfiles = 1
  g.nvim_tree_highlight_opened_files = 1 
  g.lua_tree_git_hl = 1
  g.lua_tree_show_icons = {
    git= 1,
    folders= 1,
    files= 1,
    folder_arrows = 0
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
  g.nvim_tree_window_picker_exclude = {
    filetype= {
    "notify",
    "packer",
    "qf"
    },
    buftype= {
    "terminal"
    }
  }
  vim.cmd("highlight NvimTreeFolderIcon guibg=blue")
  map('n','<leader>o',':NvimTreeToggle<cr>',{noremap=true})
  map('n','<leader>r',':NvimTreeRefresh<cr>',{noremap=true})
  map('n','<leader>n',':NvimTreeFindFile<CR>',{noremap=true})
end

return nvimtree
