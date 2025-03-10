local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values

local M = {}

local live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local first = string.sub(prompt, 1, 1)
      local pieces = vim.split(prompt, " ")
      local args = { "rg" }

      local home = os.getenv("HOME") -- Get the home directory

      local lookup = {
        f = {
          paths = { home .. "/goHy2/core-customize/hybris/bin/custom/gorenje/ggfacades/src/si/zenlab/gg/facades/impl" },
          pattern = "public.*",
        },
        x = {
          paths = { home .. "/goHy2/core-customize/hybris/bin/custom/gorenje/ggcore/resources/ggcore-items.xml" },
          pattern = "(type|attribute).*",
        },
        c = {
          paths = {
            home .. "/goHy2/core-customize/hybris/bin/custom/ggcommercewebservices/web/src/si/zenlab/v2/controller",
          },
          pattern = "RequestMapping.*",
        },
        d = {
          paths = { home .. "/goHy2/core-customize/hybris/bin/custom/gorenje/ggcore/src/si/zenlab/gg/core/daos/impl" },
          pattern = "public.*",
        },
        s = {
          paths = {
            home .. "/goHy2/core-customize/hybris/bin/custom/gorenje/ggcore/src/si/zenlab/gg/core/service/impl",
          },
          pattern = "public.*",
        },
        p = {
          paths = {
            home .. "/goHy2/core-customize/hybris/bin/custom/gorenje/ggfacades/src/si/zenlab/gg/facades/populators",
          },
          pattern = "public class.*",
        },
      }

      local target_dirs = lookup[first].paths
      local pattern = lookup[first].pattern

      -- If we found a matching directory, add it to args
      if #pieces > 1 then
        table.insert(args, "-e")
        table.insert(args, pattern .. pieces[2])
        print("Search term:", pattern .. pieces[2])
      end

      if #target_dirs > 0 then
        for _, dir in ipairs(target_dirs) do
          table.insert(args, dir)
          print("Search directory:", dir)
        end
      end

      return vim
        .iter({
          args,
          {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
        })
        :flatten()
        :totable()
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  })

  pickers
    .new(opts, {
      debounce = 100,
      prompt_title = "SAP Commerce Grep",
      finder = finder,
      previewer = conf.grep_previewer(opts),
      sorter = require("telescope.sorters").empty(),
    })
    :find()
end

M.setup = function()
  vim.keymap.set("n", "<leader>ss", live_multigrep)
end

return M
