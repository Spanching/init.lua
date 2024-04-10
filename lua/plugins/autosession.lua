return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        })
        vim.keymap.set("n", "<leader>ss", vim.cmd.SessionSave)
        vim.keymap.set("n", "<leader>sr", vim.cmd.SessionRestore)
    end
}
