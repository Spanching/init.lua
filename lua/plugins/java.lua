return {
    {
        "mfussenegger/nvim-jdtls",
        config = function ()
            vim.keymap.set('n', '<leader>tc', function ()
                require('jdtls').test_class()
            end)
            vim.keymap.set('n', '<leader>tm', function ()
                require('jdtls').test_nearest_method()
            end)
            vim.keymap.set('n', '<leader>ts', function ()
                require('jdtls.tests').goto_subjects()
            end)
        end
    }
}
