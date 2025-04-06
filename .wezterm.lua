local wezterm = require("wezterm")

local config = {}

local act = wezterm.action

-- config.font = wezterm.font("Fira Code")
-- config.font = wezterm.font_with_fallback({
-- 	{ family = "Fira Code" }, -- Primary font
-- 	{ family = "Heiti SC", weight = "Medium" }, -- Fallback font with scaling
-- })
config.font = wezterm.font_with_fallback({
	{ family = "Maple Mono NF CN" }, -- Primary font
})
config.font_size = 19
config.color_scheme = "Catppuccin Mocha"

config.enable_tab_bar = false
-- config.window_background_opacity = 0
-- config.macos_window_background_blur = 0

config.window_background_image = "/Users/phil_oh/wezterm_bg_image_dark.png"

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
