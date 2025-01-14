return {
  {
    "refractalize/oil-git-status.nvim",

    dependencies = {
      "stevearc/oil.nvim",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("oil").setup({
          keymaps = {
            ["\\"] = "actions.close",
          },
          view_options = {
            show_hidden = true,
          },
          win_options = {
            signcolumn = "yes:2",
          },
          -- Open parent directory in current window
          vim.keymap.set("n", "\\", "<CMD>Oil<CR>", { desc = "Open parent directory" }),

          skip_confirm_for_simple_edits = true,
        })
      end,
    },

    config = true,
  },
}
