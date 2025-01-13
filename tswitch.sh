#!/bin/zsh

# Path to configuration files
WEZTERM_CONFIG="$HOME/.wezterm.lua"
TMUX_CONFIG="$HOME/.tmux.conf"
NVIM_MAIN_THEME_CONFIG="$HOME/.config/nvim/lua/philo/plugins/catppuccin.lua"
NVIM_LUALINE_CONFIG="$HOME/.config/nvim/lua/philo/plugins/lualine.lua"
SKETCHYBAR_COLOR_CONFIG="$HOME/.config/sketchybar/colors.sh"

# Check if an argument is provided
if [[ -z "$1" ]]; then
  echo "Usage: $0 <light|dark>"
  exit 1
fi

# Set the theme based on the argument
if [[ "$1" == "light" ]]; then
  wallpaper set ~/wezterm_bg_image_light.png
  sed -i '' 's/BLACK=0xff181926/BLACK=0xffcad3f5/' "$SKETCHYBAR_COLOR_CONFIG"
  sed -i '' 's/WHITE=0xffcad3f5/WHITE=0xff181926/' "$SKETCHYBAR_COLOR_CONFIG"
  sed -i '' 's/wezterm_bg_image_dark.png/wezterm_bg_image_light.png/' "$WEZTERM_CONFIG"
  sed -i '' 's/Catppuccin Mocha/Catppuccin Latte/' "$WEZTERM_CONFIG"
  sed -i '' 's/mocha/latte/' "$TMUX_CONFIG"
  sed -i '' 's/mocha/latte/' "$NVIM_MAIN_THEME_CONFIG"
  sed -i '' 's/get_palette("mocha")/get_palette("latte")/' "$NVIM_LUALINE_CONFIG"
  echo "Switched to light theme in Wallpaper, sketchybar, WezTerm, tmux, neovim."
elif [[ "$1" == "dark" ]]; then
  wallpaper set ~/wezterm_bg_image_dark.png
  sed -i '' 's/BLACK=0xffcad3f5/BLACK=0xff181926/' "$SKETCHYBAR_COLOR_CONFIG"
  sed -i '' 's/WHITE=0xff181926/WHITE=0xffcad3f5/' "$SKETCHYBAR_COLOR_CONFIG"
  sed -i '' 's/wezterm_bg_image_light.png/wezterm_bg_image_dark.png/' "$WEZTERM_CONFIG"
  sed -i '' 's/Catppuccin Latte/Catppuccin Mocha/' "$WEZTERM_CONFIG"
  sed -i '' 's/latte/mocha/' "$TMUX_CONFIG"
  sed -i '' 's/latte/mocha/' "$NVIM_MAIN_THEME_CONFIG"
  sed -i '' 's/get_palette("latte")/get_palette("mocha")/' "$NVIM_LUALINE_CONFIG"
  echo "Switched to dark theme in Wallpaper, sketchybar, WezTerm, tmux, neovim."
else
  echo "Error: Invalid theme preference. Use 'light' or 'dark'."
  exit 1
fi

tmux source-file "$TMUX_CONFIG" 2>/dev/null
tmux kill-server 2>/dev/null

exit 0
