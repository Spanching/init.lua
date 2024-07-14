return {
    "moll/vim-bbye",
    config = function ()
        vim.keymap.set('n', '<leader>bc', '<cmd>Bdelete<CR>')
    end
}
