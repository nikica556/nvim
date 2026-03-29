return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  opts = {
    legacy_commands = false,
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
        vim.api.nvim_command("Obsidian new")
      end,
      desc = "[O]bsidian [N]ew Note",
    },
    {
      "<leader>ob",
      function()
        vim.api.nvim_command("Obsidian backlinks")
      end,
      desc = "[O]bsidian [B]acklinks",
    },
    {
      "<leader>ol",
      function()
        vim.api.nvim_command("Obsidian links")
      end,
      desc = "[O]bsidian [L]inks",
    },
  },
}
