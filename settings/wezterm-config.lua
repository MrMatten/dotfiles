local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "nord"
config.font_size = 16.0
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 10,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_decorations = "RESIZE"

return config
