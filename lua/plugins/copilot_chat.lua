return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },       -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },        -- for curl, log wrapper
    },
    opts = {
      debug = false,       -- Enable debugging
    },
    -- See Commands section for default commands if you want to lazy load on them
    config = function()
      require('CopilotChat').setup({
        debug = true,
      })
      vim.keymap.set("n", "<leader>cct", function()
        require('CopilotChat').toggle({
          window = {
            layout = 'float',
            title = 'Copilot Chat',
          },
        })
      end)
      vim.keymap.set("n", "<leader>cce", function()
        require('CopilotChat').ask("Explain how it works.", {
          window = {
            layout = 'float',
            title = 'Copilot Chat',
          },
          selection = require("CopilotChat.select").buffer,
        })
      end)
    end
  },
}
