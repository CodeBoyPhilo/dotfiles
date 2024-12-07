return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		lazygit = { enabled = true },
		notify = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		win = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
		dashboard = {
			preset = {
				keys = {
					{
						icon = "󰱼 ",
						key = "f",
						desc = "Find File",
						action = ":lua Snacks.dashboard.pick('files')",
						hidden = true,
					},
					{
						icon = " ",
						key = "w",
						desc = "Find word",
						action = ":lua Snacks.dashboard.pick('live_grep')",
						hidden = true,
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						hidden = true,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa", hidden = true },
				},
			},
			sections = {
				{
					section = "terminal",
					cmd = "chafa ~/Desktop/philo/codeboy.png -f symbols --size 120x140 --symbols sextant",
					enabled = vim.api.nvim_win_get_width(0) ~= 116,
					height = 9,
					width = 120,
					indent = -30,
					padding = 1,
				},
				{
					section = "terminal",
					cmd = "chafa ~/Desktop/philo/landscape.png -f symbols --size 40x80 --symbols sextant",
					enabled = vim.api.nvim_win_get_width(0) ~= 116,
					height = 13,
					width = 80,
					indent = 10,
					padding = 1,
				},
				{ section = "startup", padding = 1 },
				{
					align = "center",
					text = {
						{ " 󰱼 File", hl = "DbFindFile" },
						{ " |", hl = "DbSeparator" },
						{ "  Word", hl = "DbFindWord" },
						{ " |", hl = "DbSeparator" },
						{ "  Config", hl = "DbConfig" },
						{ " |", hl = "DbSeparator" },
						{ "  Quit", hl = "DbQuit" },
					},
					padding = 1,
				},
				{
					section = "keys",
					padding = 1,
				},
				{
					icon = " ",
					title = "Recent Files",
					section = "recent_files",
					indent = 2,
					padding = 1,
				},
				{
					icon = " ",
					title = "Projects",
					section = "projects",
					indent = 2,
					padding = 1,
				},
			},
		},
	},
	keys = {
		{
			"<leader>un",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gb",
			function()
				Snacks.git.blame_line()
			end,
			desc = "Git Blame Line",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Lazygit Log (cwd)",
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				Snacks.toggle.treesitter():map("<leader>uT")
			end,
		})
	end,
}
