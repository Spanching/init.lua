return {
    {
        'rmagatti/goto-preview',
        config = function()
            local function filenameFirst(_, path)
                local tail = vim.fs.basename(path)
                local parent = vim.fs.dirname(path)
                if parent == "." then return tail end
                -- return string.format("%s\t\t%s", tail, parent)
                return string.format("%s", tail)
            end
            require("goto-preview").setup {
                width = 150,
                height = 30,
                references = {
                    telescope = require('telescope.themes').get_dropdown({
                        hide_preview = false,
                        path_display = filenameFirst,
                        initial_mode = "normal",
                    }),
                },
                default_mappings = true,
            }
        end
    },
}
