return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		bufdelete = { enabled = false },
		debug = { enabled = false },
		lazygit = { enabled = true },
		notify = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		rename = { enabled = true },
		win = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
		dashboard = {
			preset = {
				keys = {
					{ icon = " ", key = "e", desc = "New file", action = ":ene | startinsert" },
					{
						icon = "ﭯ ",
						key = "o",
						desc = "Recently opened files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{ icon = "󰱼 ", key = "f", desc = "Find file", action = ":lua Snacks.dashboard.pick('files')" },
					{
						icon = " ",
						key = "r",
						desc = "Find word",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "g",
						desc = "Find modified file",
						action = ":lua Snacks.dashboard.pick('git_status')",
					},
					-- { icon = " ", key = "z", desc = "ZSH", action = ":e ~/.zshrc" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
			sections = {
				{
					section = "terminal",
					cmd = "chafa ~/Desktop/philo/art.png --format symbols --symbols sextant --scale 0.5",
					height = 20,
					width = 80,
					indent = -3,
					padding = 1,
				},
				{ section = "startup", padding = 1 },
				{
					section = "keys",
					gap = 1,
					padding = 1,
				},
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
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
