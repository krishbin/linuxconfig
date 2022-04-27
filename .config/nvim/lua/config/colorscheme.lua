local ui = {}

local g = vim.g
ui.vim_color = "nord"
ui.statusbar_color = "nord"


--function ui.set_colorscheme(color_sheme)
--  vim.cmd("colorscheme " .. ui.vim_color)
--end

function ui.setup()
--  g.gruvbox_material_background = 'medium'
--  g.gruvbox_material_enable_italic = 1
--  g.gruvbox_material_disable_italic_comment = 1
--  g.gruvbox_material_diagnostic_line_highlight = 1
  vim.g.nord_contrast = false
  vim.g.nord_borders = false
  vim.g.nord_disable_background = false
  vim.g.nord_italic = false
--  ui.set_colorscheme(ui.vim_color)
  require('nord').set()
end

return ui
