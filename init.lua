-- [[ Globals ]]
print("reload ...")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Lazy ]]
require("core.lazy")

-- [[ Optionals ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.winborder = "rounded"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.splitbelow = true
vim.opt.confirm = true
vim.opt.updatetime = 200
vim.opt.termguicolors = true
vim.opt.statusline = "%t %h%m%r [%{FugitiveHead()}] %=%-14.(%l,%c%V%) %P"
vim.diagnostic.config({ virtual_text = true })

-- [[ Keymaps ]]
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-c>", "a<C-c>")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<Esc>", function()
  vim.api.nvim_command("nohlsearch")
end)

-- [[ Autocommands ]]
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("WA", "wa", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})
vim.api.nvim_create_user_command("WQa", "wqa", {})
vim.api.nvim_create_user_command("WQA", "wqa", {})
vim.api.nvim_create_user_command("So", "so", {})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.c",
  group = vim.api.nvim_create_augroup("make-on-save-c", { clear = true }),
  callback = function()
    vim.fn.jobstart({ "sh", "-c", "make >/dev/null 2>&1" }, { detach = true })
  end,
})

-- [[ 0.12+ plugins ]]
-- vim.packadd("undotree")

-- [[ Highlighting ]]
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
