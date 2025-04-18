return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    opts = {
      mappings = {
        reset = {
          normal = "<C-x>",
          insert = "<C-x>",
        },
      },
    },
    keys = {
      {
        "<leader>cc",
        function()
          vim.api.nvim_command("CopilotChat")
        end,
        desc = "[C]opilot [C]hat",
      },
      {
        "<leader>cs",
        function()
          vim.api.nvim_command("CopilotChatModels")
        end,
        desc = "[C]opilot Model[s]",
      },
      {
        "<leader>cm",
        function()
          vim.api.nvim_command("CopilotChatCommit")
        end,
        desc = "[C]opilot [C]ommit",
      },
    },
  },
}
