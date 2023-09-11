local wezterm = require 'wezterm';
local mux = wezterm.mux
config = {}
for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
  if gpu.backend == 'Vulkan' and gpu.device_type == 'IntegratedGpu' then
    config.webgpu_preferred_adapter = gpu
    config.front_end = 'WebGpu'
    break
  end
end
config.colors = require"colors".colors
-- local default_prog = { "/home/krishbin/.cargo/bin/nu"}
config.font = wezterm.font(
    "JetBrainsMono Nerd Font",
    {weight="Medium", italic=false}
)
config.window_decorations = "RESIZE"
config.font_size = 13.0
config.default_cursor_style = 'BlinkingBar'
config.animation_fps = 75
config.hide_tab_bar_if_only_one_tab = true
config.check_for_updates = false
config.enable_scroll_bar = false
-- default_prog = default_prog,
config.window_close_confirmation = "AlwaysPrompt"
config.leader = { key = "a", mods = "CTRL" }
config.keys = require"keymaps"
--config.color_scheme = "Solarized Light"
require"tab_bar"

wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

return config
