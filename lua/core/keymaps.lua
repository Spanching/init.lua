vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- faster write, quit
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")

-- window navigation
vim.keymap.set("n", "<C-J>", "<C-w><C-j>")
vim.keymap.set("n", "<C-K>", "<C-w><C-k>")
vim.keymap.set("n", "<C-L>", "<C-w><C-l>")
vim.keymap.set("n", "<C-H>", "<C-w><C-h>")

-- no use of arrow keys in normal mode
vim.keymap.set("n", "<up>", "<Nop>")
vim.keymap.set("n", "<down>", "<Nop>")
vim.keymap.set("n", "<left>", "<Nop>")
vim.keymap.set("n", "<right>", "<Nop>")
