require("noice").setup({

	-- add any options here
	lsp = {
		-- can not filter null-ls's data
		-- j-hui/fidget.nvim
		progress = {
			enabled = false,
		},
	},
	views = {
		cmdline_popup = {
			border = {
				style = "none",
				padding = { 2, 3 },
			},
			filter_options = {},
			win_options = {
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
		popupmenu = {
			backend = "cmp",
			relative = "editor",
			position = {
				row = 8,
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},
	routes = {
		{
			filter = {
				event = "msg_show",
				kind = "",
				find = "written",
			},
			opts = { skip = true },
		},
	},
	{
		filter = {
			event = "msg_show",
			kind = "search_count",
		},
		opts = { skip = true },
	},
})
