return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {
      win = {
        input = {
          keys = {
            ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
            ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
          },
        },
      },
    },
    image = {
      convert = {
        notify = false,
      },
    },
    notifier = {},
  },
  keys = {
    {
      "<leader>sf",
      function()
        Snacks.picker.files()
      end,
      desc = "[S]earch [F]iles",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "[S]earch [G]rep",
    },
    {
      "<leader>sn",
      function()
        Snacks.picker.files({ cwd = "~/.config/nvim" })
      end,
      desc = "[S]earch [F]iles",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "[S]earch [C]hanges",
    },
    {
      "<leader>sb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "[S]earch [B]rances",
    },
    {
      "<leader>sr",
      function()
        Snacks.picker.resume()
      end,
      desc = "[S]earch [R]esume",
    },
    {
      "<leader>s.",
      function()
        Snacks.picker.recent()
      end,
      desc = "[S]earch Recent",
    },
    {
      "<leader>sp",
      function()
        Snacks.picker.lazy()
      end,
      desc = "Search for Plugin Spec",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.help()
      end,
      desc = "[S]earch [H]elp",
    },
    {
      "<leader>so",
      function()
        Snacks.picker.files({ cwd = "~/vaults/personal" })
      end,
      desc = "[S]earch [O]bsidian",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "[S]earch [W]ord",
      mode = { "n", "x" },
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "[S]earch [D]iagnostics",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "[S]earch [Q]uickfix",
    },
    {
      "<leader>su",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo History",
    },
    -- LSP
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Goto Definition",
    },
    {
      "gD",
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = "Goto Declaration",
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = "References",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Goto Implementation",
    },
    {
      "gy",
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = "Goto T[y]pe Definition",
    },
    {
      "<leader>ss",
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = "LSP Symbols",
    },
    {
      "<leader>sS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    {
      "<leader>sS",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "LSP Workspace Symbols",
    },
    -- CUSTOM HYBRIS SEARCH
    {
      "<leader>sh",
      function()
        local choices = {
          "facades",
          "controllers",
          "populators",
          "services",
          "XMLs",
          "DAOs",
        }
        vim.ui.select(choices, {
          prompt = "Select a directory:",
          format_item = function(item)
            return item
          end,
        }, function(choice)
          if choice then
            local searches = {
              controllers = {
                dir = "~/goHy2/core-customize/hybris/bin/custom/ggcommercewebservices/web/src/si/zenlab/v2/controller",
                search = "value =.*",
              },
              facades = {
                dir = "~/goHy2/core-customize/hybris/bin/custom/gorenje/ggfacades/src/si/zenlab/gg/facades/impl",
                search = "public.*",
              },
              DAOs = {
                dir = "~/goHy2/core-customize/hybris/bin/custom/gorenje/ggcore/src/si/zenlab/gg/core/daos/impl",
                search = "public.*",
              },
              populators = {
                dir = "~/goHy2/core-customize/hybris/bin/custom/gorenje/ggfacades/src/si/zenlab/gg/facades/populators",
                search = "public class.*",
              },
              services = {
                dir = "~/goHy2/core-customize/hybris/bin/custom/gorenje/ggcore/src/si/zenlab/gg/core/service/impl",
                search = "public.*",
              },
              XMLs = {
                dir = "~/goHy2/core-customize/hybris/bin/custom/gorenje/ggcore/resources/ggcore-items.xml",
                search = "(type|attribute).*",
              },
            }
            Snacks.picker.grep({
              dirs = { searches[choice].dir },
              search = searches[choice].search,
            })
          end
        end)
      end,
      desc = "[S]earch [H]ybris",
    },
  },
}
