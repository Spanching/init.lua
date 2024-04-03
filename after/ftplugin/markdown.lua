
vim.keymap.set('n', '<leader>p', function ()
  vim.cmd.Glow { vim.api.nvim_buf_get_name(0) }
end)
