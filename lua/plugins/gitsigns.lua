return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup({
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                -- Show git changes
                vim.keymap.set("n", "<leader>gph", gitsigns.preview_hunk)
                vim.keymap.set('n', '<leader>gsh', gitsigns.stage_hunk)
                vim.keymap.set('n', '<leader>guh', gitsigns.undo_stage_hunk)
                vim.keymap.set("n", "<leader>grh", gitsigns.reset_hunk)
                vim.keymap.set('v', '<leader>gsh', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                vim.keymap.set('v', '<leader>grh', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
                vim.keymap.set('n', '<leader>gsb', gitsigns.stage_buffer)
                vim.keymap.set('n', '<leader>grb', gitsigns.reset_buffer)
                vim.keymap.set('n', '<leader>gbl', function() gitsigns.blame_line{full=true} end)
                vim.keymap.set('n', '<leader>gtb', gitsigns.toggle_current_line_blame)
                vim.keymap.set('n', '<leader>gdt', gitsigns.diffthis)
                vim.keymap.set('n', '<leader>gtd', gitsigns.toggle_deleted)
                vim.keymap.set('n', '<leader>ghn', function () gitsigns.nav_hunk('next') end)
                vim.keymap.set('n', '<leader>ghp', function () gitsigns.nav_hunk('prev') end)

                vim.keymap.set('n', '<leader>gca', gitsigns.get_actions)
            end
        })
        local wk = require("which-key")
        wk.add({
                {"<leader>gph", desc = "Preview Hunk" },
                {'<leader>guh', desc = "Undo Stage Hunk" },
                {'<leader>gbl', desc = "Blame full Line" },
                {'<leader>gdt', desc = "Diff This" },

                -- Navigate Group
                {"<leader>gh", group = "Nativate Hunk" },
                {'<leader>ghn', desc = "Next" },
                {'<leader>ghp', desc = "Prev" },

                -- Stage Group
                {"<leader>gs", group = "Stage" },
                {'<leader>gsh', desc = "Hunk" },
                {'<leader>gsb', desc = "Buffer" },

                -- Reset Group
                {"<leader>gr", group = "Reset" },
                {"<leader>grh", desc = "Hunk" },
                {'<leader>grb', desc = "Buffer" },

                -- Toggle Group
                {"<leader>gt", group = "Toggle" },
                {'<leader>gtb', desc = "current line Blame" },
                {'<leader>gtd', desc = "Deleted" },
        })
    end
}
