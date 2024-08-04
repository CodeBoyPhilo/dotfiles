return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- local colors = {
		--   blue = "#65D1FF",
		--   green = "#3EFFDC",
		--   violet = "#FF61EF",
		--   yellow = "#FFDA7B",
		--   red = "#FF4A4A",
		--   fg = "#c3ccdc",
		--   bg = "#112638",
		--   inactive_bg = "#2c3043",
		-- }

		local colors = require("catppuccin.palettes").get_palette("macchiato")

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.base, gui = "bold" },
				b = { bg = colors.base, fg = colors.text },
				c = { bg = colors.base, fg = colors.text },
			},
			insert = {
				a = { bg = colors.green, fg = colors.base, gui = "bold" },
				b = { bg = colors.base, fg = colors.text },
				c = { bg = colors.base, fg = colors.text },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.base, gui = "bold" },
				b = { bg = colors.base, fg = colors.text },
				c = { bg = colors.base, fg = colors.text },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.base, gui = "bold" },
				b = { bg = colors.base, fg = colors.text },
				c = { bg = colors.base, fg = colors.text },
			},
			replace = {
				a = { bg = colors.red, fg = colors.base, gui = "bold" },
				b = { bg = colors.base, fg = colors.text },
				c = { bg = colors.base, fg = colors.text },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = my_lualine_theme,
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
