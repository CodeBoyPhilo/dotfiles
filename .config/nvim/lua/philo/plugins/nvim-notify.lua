return {
	"rcarriga/nvim-notify",
	init = function()
		vim.notify = require("notify").setup({
			background_colour = "#000000",
		})
	end,
}
