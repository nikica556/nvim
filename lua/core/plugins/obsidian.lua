return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/personal",
      },
    },
  },
  keys = {
    {
      "<leader>on",
      function()
        vim.api.nvim_command("ObsidianNew")
      end,
      desc = "[O]bsidian [N]ew Note",
    },
    {
      "<leader>ob",
      function()
        vim.api.nvim_command("ObsidianBacklinks")
      end,
      desc = "[O]bsidian [B]acklinks",
    },
    {
      "<leader>ol",
      function()
        vim.api.nvim_command("ObsidianLinks")
      end,
      desc = "[O]bsidian [L]inks",
    },
  },
}
