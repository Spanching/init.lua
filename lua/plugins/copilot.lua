return {
  {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require('copilot').setup({
          panel = {
            enabled = true,
            auto_refresh = false,
            keymap = {
              jump_prev = "[[",
              jump_next = "]]",
              accept = "<CR>",
              refresh = "gr",
            },
            layout = {
              position = "right",               -- | top | left | right
              ratio = 0.4
            },
          },
          suggestions = {
            enabled = false,
          },
          filetypes = {
            markdown = false,
            help = false,
          },
        })
        vim.keymap.set("n", "<leader>cp", function()
          require("copilot.panel").open({ "right", 0.4 })
        end)
      end
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
