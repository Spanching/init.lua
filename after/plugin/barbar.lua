vim.g.barbar_auto_setup = false -- disable auto-setup

require'barbar'.setup {
  sidebar_filetypes = {
    NvimTree = true,
    undotree = {text = 'undotree'},
  },
}

vim.keymap.set("n", "<leader>bc", vim.cmd.BufferClose)
vim.keymap.set("n", "<leader>bn", vim.cmd.BufferNext)
vim.keymap.set("n", "<leader>bp", vim.cmd.BufferPrevious)
