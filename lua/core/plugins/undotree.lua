return {
  "mbbill/undotree",
  opts = {},
  keys = {
    {
      "<leader>u",
      function()
        vim.cmd.UndotreeToggle() -- Toggle the Undotree
      end,
      desc = "Toggle [U]ndotree",
    },
  },
}
