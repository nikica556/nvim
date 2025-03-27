-- [[ Global options ]]

print("reloading ...")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- [[ Lazy ]]

require("core.lazy")

-- [[ Setting options ]]

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.conceallevel = 1
vim.opt.splitbelow = true
vim.opt.confirm = true

-- [[ Virtual text ]]

vim.diagnostic.config({ virtual_text = true })

-- [[ Basic Keymaps ]]

vim.keymap.set("n", "<leader><leader>x", "<CMD>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "^", "<C-^>")
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")

-- [[ Basic Autocommands ]]

vim.api.nvim_command("command! W w")
vim.api.nvim_command("command! Q q")
vim.api.nvim_command("command! Wq wq")
vim.api.nvim_command("command! WQ wq")
vim.api.nvim_command("command! Wa wa")
vim.api.nvim_command("command! WA wa")
vim.api.nvim_command("command! Wqa wqa")
vim.api.nvim_command("command! WQa wqa")
vim.api.nvim_command("command! WQA wqa")

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    if vim.v.event.operator == "y" then
      vim.fn.setreg("+", vim.fn.getreg('"'))
    end

    vim.highlight.on_yank()
  end,
})
