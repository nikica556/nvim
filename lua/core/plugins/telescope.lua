return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Ensure that Telescope is fully loaded before setting keymaps
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>sf", builtin.find_files)
    vim.keymap.set("n", "<leader>sg", builtin.live_grep)
    vim.keymap.set("n", "<leader>sr", builtin.resume)
    vim.keymap.set("n", "<leader>sh", builtin.help_tags)
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles)
    vim.keymap.set("n", "<leader>sw", builtin.grep_string)
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics)
  end,
}
