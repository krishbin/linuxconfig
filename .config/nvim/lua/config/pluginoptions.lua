local popt = {}

local g = vim.g

function vimtex_options()
g.tex_flavor = "latex"
g.vimtex_view_method = 'zathura'
g.vimtex_enabled=1
g.vimtex_fold_enabled=1
end

function other_options()
g.signify_disable_by_default=1

g.python3_host_prog="/usr/bin/python3"

g.completion_sorting = "length"
g.completion_trigger_keyword_length = 3
g.completion_timer_cycle = 200

g.startify_bookmarks = {
  { i='~/.config/nvim/init.lua'},
  { z='~/.zshrc' },
  { m='~/devel/lang/cpp/jpeg_compressor/src/main.cpp' }
}
g.startify_change_to_vcs_root = 0
end

function popt.setup()
  vimtex_options()
  other_options()
end

return popt
