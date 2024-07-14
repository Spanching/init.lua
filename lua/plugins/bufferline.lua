return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    after = "catppuccin",
    config = function()
        vim.opt.termguicolors = true
        require('bufferline').setup({
            options = {
                mode = 'buffers',
                offsets = {
                    { filetype = 'NvimTree' }
                },
            },
            highlights = require("catppuccin.groups.integrations.bufferline").get({
                styles = { "bold" },
                custom = {
                    all = {
                        fill = { bg = "#292c3c" },
                        buffer_selected = {
                            italic = false
                        },
                    },
                }
            })
        })
    end
}
