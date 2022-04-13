local telescope ={}
local map = require('utils').map
local actions = require('telescope.actions')
local action_layout = require("telescope.actions.layout")

function telescope.setup()

  require('telescope').setup{
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--trim"
      },
      mappings = {
        n = {
          ["<M-p>"] = action_layout.toggle_preview
        },
        i = {
          ["<M-q>"] = actions.close,
          ["<M-p>"] = action_layout.toggle_preview,
          ["<C-u>"] = false
        },
      },
    }
  }
end

return telescope
