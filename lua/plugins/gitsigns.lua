return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require('gitsigns').setup()

    -- Show git changes
    vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk")
  end
}
