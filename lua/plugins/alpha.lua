return {
    "goolord/alpha-nvim",
    requires = {
        'nvim-tree/nvim-web-devicons',
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require("alpha").setup(require("alpha.themes.startify").opts)
    end,
}
