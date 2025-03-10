return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
      },
    })

    -- Custom Keymaps
    vim.keymap.set("n", "<leader>on", "<CMD>ObsidianNew<CR>", { desc = "[O]bsidian [N]ew Note" })
    vim.keymap.set("n", "<leader>ob", "<CMD>ObsidianBacklinks<CR>", { desc = "[O]bsidian [B]acklinks" })
    vim.keymap.set("n", "<leader>ol", "<CMD>ObsidianLinks<CR>", { desc = "[O]bsidian [L]inks" })
  end,
}
