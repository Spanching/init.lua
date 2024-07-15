return {
    "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup {
            condition = function(buf)
                if string.match(vim.loop.cwd(), ".config\\nvim$") then
                    return false
                end
                local fn = vim.fn
                local utils = require("auto-save.utils.data")
                if fn.getbufvar(buf, "&modifiable") == 1 and
                    utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                    return true -- met condition(s), can save
                end
                if vim.bo[buf].filetype == "harpoon" or vim.bo[buf].filetype == "NvimTree" then
                    return false
                end
                return false -- can't save
                -- ... the rest of your condition code
            end
            -- your config goes here
            -- or just leave it empty :)
        }
    end,
}
