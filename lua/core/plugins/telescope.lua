return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "N1kica/telescope-changed-files",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Ensure that Telescope is fully loaded before setting keymaps
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>sf", builtin.find_files)
    vim.keymap.set("n", "<leader>sr", builtin.resume)
    vim.keymap.set("n", "<leader>sh", builtin.help_tags)
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles)
    vim.keymap.set("n", "<leader>sw", builtin.grep_string)
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics)

    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })

    vim.keymap.set("n", "<leader>sc", "<CMD>Telescope changed_files<CR>")

    require("core.telescope.multigrep").setup()
  end,
}
