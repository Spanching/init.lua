return {
    "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup {
            condition = function(buf)
                if string.match(vim.loop.cwd(), ".config\\nvim$") then
                    return false
                end
                if pcall(function () return vim.bo[buf].filetype == "harpoon" end) then
                  return false
                end
                local fn = vim.fn
                local utils = require("auto-save.utils.data")
                if fn.getbufvar(buf, "&modifiable") == 1 and
                    utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                    return true -- met condition(s), can save
                end
                return false -- can't save
                -- ... the rest of your condition code
            end
            -- your config goes here
            -- or just leave it empty :)
        }
    end,
}
