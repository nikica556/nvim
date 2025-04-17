return {
  {
    "stevearc/oil.nvim",
    dependencies = {
      "refractalize/oil-git-status.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      keymaps = {
        ["\\"] = "actions.close",
      },
      view_options = {
        show_hidden = true,
      },
      win_options = {
        signcolumn = "yes:2",
      },
      skip_confirm_for_simple_edits = true,
    },
    keys = {
      {
        "\\",
        function()
          vim.api.nvim_command("Oil")
        end,
        desc = "Open parent directory",
      },
    },
  },
}
