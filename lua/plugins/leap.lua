return {
  "ggandor/leap.nvim",
  config = function()
    -- Leap mappings
    vim.keymap.set({ 'n', 'x', 'o' }, '<leader>s', '<Plug>(leap-forward)')
    vim.keymap.set({ 'n', 'x', 'o' }, '<leader>S', '<Plug>(leap-backward)')
    vim.keymap.set({ 'n', 'x', 'o' }, '<leader>gs', '<Plug>(leap-from-window)')
  end
}
