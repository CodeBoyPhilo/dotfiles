local wezterm = require("wezterm")

local config = {}

local act = wezterm.action

config.font = wezterm.font("Liga SFMono Nerd Font", { weight = "Bold" })
config.font_size = 18
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.window_background_opacity = 0.8
config.macos_window_background_blur = 80
config.window_decorations = "RESIZE"
config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
		mods = "NONE",
		action = act.ScrollByCurrentEventWheelDelta,
	},
	{
		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
		mods = "NONE",
		action = act.ScrollByCurrentEventWheelDelta,
	},
}
return config
