local wk = require("which-key")

wk.register({
	f = {
		name = "Find", 
		f = "Find File",
		g = "Grep all files",
		b = "Find Buffer",
		h = "Find in Help",
		r = "Find in Repository",
	},
	e = {
		name = "Explorer", 
		e = "Toggle Explorer",
		f = "Focus Explorer",
	},
	b = {
		name = "Buffer",
		n = "Buffer Next",
		p = "Buffer Previous",
		c = "Buffer Close"
	},
	g = {
		name = "Git", 
		g = "Open Lazy Git",
		p = "Git Pull",
		f = "Git Fetch",
		b = "Git Branch",
	},
	u = "Undo Tree",
	w = "Write file",
	c = {
		name = "Code",
		a = "Code action",
	},
	h = "Remove highlighting",
	D = "Type definition",
	p = "Paste from clipboard",
	q = "Quit",
	rn = "Rename Symbol"
}, { prefix = "<leader>" })
