return {
  'https://github.com/mfussenegger/nvim-dap-python',
  config = function ()
    require("dap-python").setup(".venv/Scripts/python")
  end
}
