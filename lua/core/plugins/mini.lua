return { -- Collection of various small independent plugins/modules
  "n1kica/mini.nvim",
  config = function()
    require("mini.ai").setup({ n_lines = 500 })
    require("mini.surround").setup()
    require("mini.pairs").setup()
  end,
}
