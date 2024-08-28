return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = false,
				-- auto_refresh = true,
				-- keymap = {
				-- 	jump_prev = "[[",
				-- 	jump_next = "]]",
				-- 	accept = "<CR>",
				-- 	refresh = "gr",
				-- 	open = "<M-CR>",
				-- },
				-- layout = {
				-- 	position = "bottom", -- | top | left | right
				-- 	ratio = 0.4,
				-- },
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 75,
				keymap = {
					accept = "<Tab>",
					accept_word = "<C-]>",
					accept_line = "<M-C-]>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<Esc>",
				},
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
			copilot_node_command = "node", -- Node.js version must be > 18.x
			server_opts_overrides = {},
		})
	end,
}
