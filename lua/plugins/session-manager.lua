return {
    "Shatur/neovim-session-manager",
    config = function()
        -- Auto save session
        vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
            callback = function()
                for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                    -- Don't save while there's any 'nofile' buffer open.
                    if vim.api.nvim_get_option_value("buftype", { buf = buf }) == 'nofile' then
                        return
                    end
                end
                require('session_manager').save_current_session()
            end
        })
        local config = require('session_manager.config')
        local values = {
            autoload_mode = { config.AutoloadMode.CurrentDir, config.AutoloadMode.LastSession }
        }
        require('session_manager').setup(values)
    end
}
