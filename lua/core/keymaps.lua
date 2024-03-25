vim.g.mapleader = " "

-- faster write, quit
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")

-- window navigation
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

-- no use of arrow keys in normal mode
vim.keymap.set("n", "<up>", "<Nop>")
vim.keymap.set("n", "<down>", "<Nop>")
vim.keymap.set("n", "<left>", "<Nop>")
vim.keymap.set("n", "<right>", "<Nop>")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move current line/block
vim.keymap.set("n", "<leader>lj", ":m .+1<CR>==")
vim.keymap.set("n", "<leader>lk", ":m .-2<CR>==")

-- Remove Highlighting
vim.keymap.set("n", "<leader>h", vim.cmd.noh)

-- Center after down/up/next
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Easy pasing from clipboard
vim.keymap.set("n", "<leader>p", '"+p')

-- Easy tabs in normal mode
vim.keymap.set("n", "<leader>>", "v>")
vim.keymap.set("n", "<leader><", "v<")

-- Easy duplicate line
vim.keymap.set("n", "<leader>ld", "yyp")

-- remap C-o for tmux
vim.keymap.set("n", "<C-a>", "<C-o>")

-- Show git changes 
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk")

-- Leap mappings
vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
