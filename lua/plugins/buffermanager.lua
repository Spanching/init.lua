return {
    'j-morano/buffer_manager.nvim',
    config = function()
        vim.keymap.set('n', '<leader>be', function() require('buffer_manager.ui').toggle_quick_menu() end,
            { noremap = true })
        require('buffer_manager').setup({
            select_menu_item_commands = {
                v = {
                    key = "|",
                    command = "vsplit"
                },
                h = {
                    key = "-",
                    command = "split"
                }
            },
            short_file_names = true,
            width = 0.3,
            height = 0.3,

        })
    end
}
