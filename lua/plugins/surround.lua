return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    local config = require("nvim-surround.config")
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
      surrounds = {
        ["("] = {
          add = { "(", ")" },
          find = function()
            return config.get_selection({ motion = "a(" })
          end,
          delete = "^(. ?)().-( ?.)()$",
        },
        [")"] = {
          add = { "( ", " )" },
          find = function()
            return config.get_selection({ motion = "a)" })
          end,
          delete = "^(.)().-(.)()$",
        },
        ["{"] = {
          add = { "{", "}" },
          find = function()
            return config.get_selection({ motion = "a{" })
          end,
          delete = "^(. ?)().-( ?.)()$",
        },
        ["}"] = {
          add = { "{ ", " }" },
          find = function()
            return config.get_selection({ motion = "a}" })
          end,
          delete = "^(.)().-(.)()$",
        },
        ["<"] = {
          add = { "<", ">" },
          find = function()
            return config.get_selection({ motion = "a<" })
          end,
          delete = "^(. ?)().-( ?.)()$",
        },
        [">"] = {
          add = { "< ", " >" },
          find = function()
            return config.get_selection({ motion = "a>" })
          end,
          delete = "^(.)().-(.)()$",
        },
        ["["] = {
          add = { "[", "]" },
          find = function()
            return config.get_selection({ motion = "a[" })
          end,
          delete = "^(. ?)().-( ?.)()$",
        },
        ["]"] = {
          add = { "[ ", " ]" },
          find = function()
            return config.get_selection({ motion = "a]" })
          end,
          delete = "^(.)().-(.)()$",
        },
      }
    })
  end,
}
