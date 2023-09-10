local wezterm = require 'wezterm';
config = {}
for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
  if gpu.backend == 'Vulkan' and gpu.device_type == 'IntegratedGpu' then
    config.webgpu_preferred_adapter = gpu
    config.front_end = 'WebGpu'
    break
  end
end

-- local default_prog = { "/home/krishbin/.cargo/bin/nu"}
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.0
config.color_scheme = "Catppuccin Mocha"
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.check_for_updates = false
config.enable_scroll_bar = false
-- default_prog = default_prog,
config.window_close_confirmation = "AlwaysPrompt"
config.leader = { key = "q", mods = "CTRL" }
config.keys = require"keymaps"

return config
