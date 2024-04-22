local function restore_nvim_tree()
end

local function close_nvim_tree()
    local api = require('nvim-tree.api')
    api.tree.close()
end

return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            pre_save_cmds = { close_nvim_tree },
            post_restore_cmds = { restore_nvim_tree },
        })

        vim.keymap.set("n", "<leader>ss", vim.cmd.SessionSave)
        vim.keymap.set("n", "<leader>sr", vim.cmd.SessionRestore)
    end
}
