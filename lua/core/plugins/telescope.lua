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

    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "[S]earch Recent Files ('.' for repeat)" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch Current [W]ord" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>sq", builtin.quickfix, { desc = "[S]earch [Q]uickfix List" })

    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })

    vim.keymap.set("n", "<leader>so", function()
      local obsidian_paths = {
        vim.fn.expand("~/vaults/personal"),
        vim.fn.expand("~/vaults/work"),
      }

      builtin.find_files({
        prompt_title = "Search Obsidian Files",
        search_dirs = obsidian_paths,
        find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
      })
    end, { desc = "[S]earch [O]bsidian files" })

    vim.keymap.set("n", "<leader>sc", "<CMD>Telescope changed_files<CR>", { desc = "[S]earch [C]handed Files" })

    require("core.telescope.multigrep").setup()
    require("core.telescope.hybrisgrep").setup()
  end,
}
