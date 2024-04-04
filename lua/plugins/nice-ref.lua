return {
  'wiliamks/nice-reference.nvim',
  requires = {
    'kyazdani42/nvim-web-devicons',
    { 'rmagatti/goto-preview', config = function() require('goto-preview').setup {} end }
  },
  config = function ()
    vim.lsp.handlers["textDocument/references"] = require 'nice-reference'.reference_handler
  end
}
