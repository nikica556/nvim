return {
  "mbbill/undotree",
  config = function() -- This is the function that runs, AFTER loading
    vim.keymap.set("n", "<leader>u", function()
      vim.cmd.UndotreeToggle() -- Toggle the Undotree
    end, { desc = "Toggle [U]ndotree" })
  end,
}
