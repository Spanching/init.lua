vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.background = "light"

-- Set undotree to windows
vim.g.undotree_DiffCommand = "FC"

vim.opt.swapfile = false

vim.wo.number = true
vim.wo.relativenumber = true

local aucmd_dict = {
    FileType = {
        {
            pattern = "help,dap-float",
            callback = function()
                vim.api.nvim_set_keymap(
                    "n",
                    "q",
                    "<cmd>close<CR>",
                    { noremap = true, silent = true }
                )
            end,
        },
    },
}

for event, opt_tbls in pairs(aucmd_dict) do
    for _, opt_tbl in pairs(opt_tbls) do
        vim.api.nvim_create_autocmd(event, opt_tbl)
    end
end

-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0


