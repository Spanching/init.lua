return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {},
	version = "^1.0.0",            -- optional: only update when a new 1.x version is released
	config = function()
		vim.g.barbar_auto_setup = false -- disable auto-setup

		require("barbar").setup({
			sidebar_filetypes = {
				NvimTree = true,
				undotree = { text = "undotree" },
			},
		})

		vim.keymap.set("n", "<leader>bc", vim.cmd.BufferClose)
		vim.keymap.set("n", "<leader>bn", vim.cmd.BufferNext)
		vim.keymap.set("n", "<leader>bp", vim.cmd.BufferPrevious)
	end
}
