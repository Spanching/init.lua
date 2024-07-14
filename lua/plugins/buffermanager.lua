return {
    'j-morano/buffer_manager.nvim',
    config = function()
        local buffer_manager_ui = require("buffer_manager.ui")
        vim.keymap.set('n', '<leader>be', buffer_manager_ui.toggle_quick_menu,
            { noremap = true })
        vim.keymap.set('n', '<leader>bn', buffer_manager_ui.nav_next)
        vim.keymap.set('n', '<leader>bp', buffer_manager_ui.nav_prev)
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
            highlights = {
                fill = {
                    bg = {
                        attribute = "fg",
                        highlight = "Pmenu"
                    }
                }
            }
        })
    end
}
