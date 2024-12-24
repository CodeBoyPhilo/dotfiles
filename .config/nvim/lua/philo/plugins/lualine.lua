return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = require("catppuccin.palettes").get_palette("mocha")

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
				ignore_focus = { "NvimTree", "AvanteInput", "Avante", "tagbar" },
			},
			sections = {
				lualine_c = { { "filename" } },
				lualine_d = {
					{
						function()
							return vim.g.remote_neovim_host and ("Remote: %s"):format(vim.uv.os_gethostname()) or ""
						end,
						padding = { right = 1, left = 1 },
						separator = { left = "", right = "" },
					},
				},
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
