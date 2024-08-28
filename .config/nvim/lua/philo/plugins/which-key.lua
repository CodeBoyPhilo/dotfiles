return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>u", group = "Upload / Download" },
			{ "<leader>ud", "<cmd>TransferDownload<cr>", desc = "Download from remote server (scp)", icon = "󰇚" },
			{ "<leader>uf", "<cmd>DiffRemote<cr>", desc = "Diff file with remote server (scp)", icon = "" },
			{ "<leader>ui", "<cmd>TransferInit<cr>", desc = "Init/Edit Deployment config", icon = "" },
			{ "<leader>ur", "<cmd>TransferRepeat<cr>", desc = "Repeat transfer command", icon = "󰑖" },
			{ "<leader>uu", "<cmd>TransferUpload<cr>", desc = "Upload to remote server (scp)", icon = "󰕒" },
		})

		wk.add({
			{ "<leader>p", group = "TagBar" },
			{ "<leader>pp", "<cmd>TagbarToggle<cr>", desc = "Toggle TagBar"},
		})
	end,
}

