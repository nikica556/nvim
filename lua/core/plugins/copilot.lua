return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
          suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = true,
            debounce = 75,
            trigger_on_accept = true,
            keymap = {
              accept = "ł",
            },
          },
        },
      },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    opts = {
      model = "claude-3.7-sonnet",
      agent = "copilot",
      mappings = {
        reset = {
          normal = "‘",
          insert = "‘",
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
        "<leader>sc",
        function()
          vim.api.nvim_command("CopilotChatModels")
        end,
        desc = "[S]earch [C]opilot Models",
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
