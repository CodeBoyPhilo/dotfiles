return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	config = function()
		local keymap = vim.keymap

		vim.keymap.set("n", "<leader>mdp", "<cmd>MarkdownPreview<CR>", { desc = "Preview markdown file" })
		vim.keymap.set("n", "<leader>mdps", "<cmd>MarkdownPreviewStop<CR>", { desc = "Stop preview markdown file" })
	end,
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}
