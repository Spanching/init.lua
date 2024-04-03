vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

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

