local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	'nvim-treesitter/nvim-treesitter',
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function ()
			vim.cmd.colorscheme "catppuccin-frappe"
		end
	},
	'mbbill/undotree',
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	'nvim-tree/nvim-tree.lua',
	{'romgrk/barbar.nvim',
	dependencies = {
		'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
		'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
	},
	init = function() vim.g.barbar_auto_setup = false end,
	opts = {
	},
	version = '^1.0.0', -- optional: only update when a new 1.x version is released
	},
	'rmagatti/auto-session',
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	},
	-- lsp setup
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			"rafamadriz/friendly-snippets",
		}
	},
	'hrsh7th/cmp-nvim-lsp',
	'm4xshen/autoclose.nvim',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	-- end lsp setup
	{
		'stevearc/dressing.nvim',
		opts = {},
	},
	{
		"Pocco81/true-zen.nvim",
		config = function()
			require("true-zen").setup {
				-- your config goes here
				-- or just leave it empty :)
			}
		end,
	},
	{
		'alexghergh/nvim-tmux-navigation', config = function()
			require'nvim-tmux-navigation'.setup {
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					last_active = "<C-\\>",
					next = "<C-Space>",
				}
			}
		end
	},
	{
		'gelguy/wilder.nvim',
	},
	{
	  'linux-cultist/venv-selector.nvim',
	  dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
	  opts = {
		-- Your options go here
		-- name = "venv",
		-- auto_refresh = false
	  },
	  event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
	  keys = {
		-- Keymap to open VenvSelector to pick a venv.
		{ '<leader>vs', '<cmd>VenvSelect<cr>' },
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		{ '<leader>vc', '<cmd>VenvSelectCached<cr>' },
	  },
	}
}

local opts = {}

require("lazy").setup(plugins, opts)
