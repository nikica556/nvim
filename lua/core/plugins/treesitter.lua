return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local parsers = require("nvim-treesitter.parsers").get_parser_configs()

    ---@diagnostic disable-next-line: inject-field
    parsers.impex = {

      install_info = {

        url = "local",

        files = { "impex.so" },
      },

      filetype = "impex",
    }

    local configs = require("nvim-treesitter.configs")

    ---@diagnostic disable-next-line: missing-fields
    configs.setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "typescript",
        "angular",
        "html",
        "sql",
      },

      sync_install = false,
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },

      indent = { enable = true },
    })
  end,
}
