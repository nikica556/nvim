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
            enabled = false,
            auto_trigger = true,
            hide_during_completion = true,
            debounce = 75,
            trigger_on_accept = true,
            keymap = {
              accept = "ł", -- <A-l>
            },
          },
          panel = {
            enabled = false,
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
          normal = "‘", -- <A-x>
          insert = "‘", -- <A-x>
        },
        submit_prompt = {
          normal = "<A-CR>", -- <C-CR> aslo works
          insert = "<A-CR>", -- <C-CR> aslo works
        },
        accept_diff = {
          normal = "ł", -- <A-l>
          insert = "ł", -- <A-l>
        },
      },
    },
    keys = {
      {
        "<leader>cc",
        function()
          vim.api.nvim_command("CopilotChatToggle")
        end,
        desc = "[C]opilot [C]hat",
        mode = { "n", "v" },
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
        mode = { "n", "v" },
      },
    },
  },
}
