return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "TelescopeResults",
            callback = function(ctx)
                vim.api.nvim_buf_call(ctx.buf, function()
                    vim.fn.matchadd("TelescopeParent", "\t\t.*$")
                    vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
                end)
            end,
        })

        local function filenameOnly(_, path)
            local tail = vim.fs.basename(path)
            return string.format("%s", tail)
        end
        local function filenameFirst(_, path)
            local tail = vim.fs.basename(path)
            local parent = vim.fs.dirname(path)
            if parent == "." then return tail end
            return string.format("%s\t\t%s", tail, parent)
        end
        require('telescope').setup({
            path_display = filenameFirst,
            defaults = {
                layout_config = {
                    vertical = {
                        width = 0.3,
                        height = 0.3,
                    },
                },
            },
            pickers = {
                lsp_definitions = {
                    path_display = filenameFirst,
                    theme = "dropdown",
                    initial_mode = "normal",
                },
                lsp_references = {
                    path_display = filenameFirst,
                    theme = "dropdown",
                    initial_mode = "normal",
                },
                lsp_implementations = {
                    path_display = filenameFirst,
                    theme = "dropdown",
                    initial_mode = "normal",
                },
                help_tags = {
                    previewer = false,
                    theme = "dropdown",
                },
                live_grep = {
                    theme = "dropdown",
                },
                git_files = {
                    path_display = filenameFirst,
                    theme = "dropdown",
                },
                find_files = {
                    path_display = filenameFirst,
                    theme = "dropdown",
                },
                buffers = {
                    path_display = filenameFirst,
                    theme = "dropdown",
                    initial_mode = "normal",
                },
            }
        })
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fr", builtin.git_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

        vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
        vim.keymap.set("n", "gr", builtin.lsp_references, {})
        vim.keymap.set("n", "gI", builtin.lsp_implementations, {})
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, {})
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, {})
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
        vim.keymap.set({ "n" }, "<space>fmf", vim.lsp.buf.format, {})
    end
}
