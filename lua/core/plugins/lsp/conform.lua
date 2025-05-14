return { -- Autoformat
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = "never"
      else
        lsp_format_opt = "fallback"
      end
      return {
        timeout_ms = 5000,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters = {
      sleek = {
        command = "sleek",
        args = { "-i", "2" },
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      html = { "prettier" },
      typescript = { "prettier" },
      javascript = { "prettier" },
      htmlangular = { "prettier" },
      htmldjango = { "prettier" },
      scss = { "prettier" },
      css = { "prettier" },
      sql = { "sleek" },
      json = { "jq" },
      groovy = { "npm-groovy-lint" },
    },
  },
}
