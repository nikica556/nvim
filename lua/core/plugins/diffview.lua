return {
  "sindrets/diffview.nvim",

  config = function() -- This is the function that runs, AFTER loading
    vim.keymap.set("n", "<leader>dv", function()
      vim.cmd.DiffviewOpen() -- Toggle the DiffView
    end, { desc = "Toggle [D]iff[V]iew" })
  end,
}
