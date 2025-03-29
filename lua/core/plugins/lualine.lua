return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    local colors = {
      black = "#000000",
      blue = "#82AAFF",
      green = "#4fd6be",
      violet = "#BB80B3",
      yellow = "#ff966c",
      red = "#F28FAD",
      fg = "#D0D0D0",
      bg = nil,
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.black, gui = "bold" },
        b = { bg = colors.black, fg = colors.fg },
        c = { bg = colors.black, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.black, gui = "bold" },
        b = { bg = colors.black, fg = colors.fg },
        c = { bg = colors.black, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.black, gui = "bold" },
        b = { bg = colors.black, fg = colors.fg },
        c = { bg = colors.black, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
        b = { bg = colors.black, fg = colors.fg },
        c = { bg = colors.black, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.black, gui = "bold" },
        b = { bg = colors.black, fg = colors.fg },
        c = { bg = colors.black, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.black, fg = colors.semilightgray, gui = "bold" },
        b = { bg = colors.black, fg = colors.semilightgray },
        c = { bg = colors.black, fg = colors.semilightgray },
      },
    }

    lualine.setup({
      options = {
        theme = my_lualine_theme,
        section_separators = " ",
        component_separators = "|",
      },
    })
  end,
}
