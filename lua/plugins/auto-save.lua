return {
	"Pocco81/auto-save.nvim",
	config = function()
		 require("auto-save").setup {
            condition = function(buf)
                if vim.bo[buf].filetype == "harpoon" then
                    return false
                end
                -- ... the rest of your condition code
            end
			-- your config goes here
			-- or just leave it empty :)
		 }
	end,
}
