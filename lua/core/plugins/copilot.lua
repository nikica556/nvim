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
              accept_word = false,
              accept_line = false,
              next = "<A-]>",
              prev = "<A-[>",
              dismiss = "<C-]>",
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
        "<leader>sc",
        function()
          vim.api.nvim_command("CopilotChatModels")
        end,
        desc = "[S]earch [C]opilot",
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
