return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	main = "nvim-silicon",
	opts = {
		-- Configuration here, or leave empty to use defaults'
		font = "Maple Mono NF CN",
		theme = "Catppuccin Mocha",
		background = "#eff1f5",
		line_offset = 1,
		to_clipboard = true,
		window_title = function()
			return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
		end,
		output = function()
			return "/Users/phil_oh/Desktop/screenshot/" .. os.date("%Y-%m-%d at %H-%M-%S") .. "_code.png"
		end,
	},
}
