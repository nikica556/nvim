vim.bo.commentstring = "#%s"
-- vim.lsp.set_log_level("info")

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.start({
  name = "impexls",
  cmd = { vim.fn.stdpath("data") .. "/mason/packages/impexls/target/release/impexls" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1]),
  capabilities = capabilities,
})

local highlight_augroup = vim.api.nvim_create_augroup("impexls-highlight", { clear = false })
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  buffer = 0,
  group = highlight_augroup,
  callback = vim.lsp.buf.document_highlight,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "WinLeave" }, {
  buffer = 0,
  group = highlight_augroup,
  callback = vim.lsp.buf.clear_references,
})
