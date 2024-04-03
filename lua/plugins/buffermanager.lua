return {
  'j-morano/buffer_manager.nvim',
  config = function()
    vim.keymap.set('n', '<leader>be', function() require('buffer_manager.ui').toggle_quick_menu() end, { noremap = true })
  end
}
