local ui = {}

local g = vim.g
ui.vim_color = "gruvbox-material"
ui.statusbar_color = "gruvbox_material"


function ui.set_colorscheme(color_sheme)
  vim.cmd("colorscheme " .. ui.vim_color)
end

function ui.setup()
  g.gruvbox_material_background = 'medium'
  g.gruvbox_material_enable_italic = 1
  g.gruvbox_material_disable_italic_comment = 1
  g.gruvbox_material_diagnostic_line_highlight = 1
  ui.set_colorscheme(ui.vim_color)
end

return ui
