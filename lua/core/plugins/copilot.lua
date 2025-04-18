return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    opts = {},
    keys = {
      {
        "<leader>cc",
        function()
          vim.api.nvim_command("CopilotChat")
        end,
        desc = "[C]opilot [C]hat",
      },
      {
        "<leader>cm",
        function()
          vim.api.nvim_command("CopilotChatModels")
        end,
        desc = "[C]opilot [M]odels",
      },
    },
  },
}
