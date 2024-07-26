local wezterm = require("wezterm")

local config = {}

config.font = wezterm.font("Liga SFMono Nerd Font", { weight = "Bold" })
config.font_size = 18
config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.window_background_opacity = 0.8
config.macos_window_background_blur = 80
config.window_decorations = "RESIZE"
return config
