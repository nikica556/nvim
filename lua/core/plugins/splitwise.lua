-- EXAMPLE:
-- return {
-- dir = "~/Projects/adopure",
-- opts = {},
-- }

local M = {}

local last_buf = -1
local last_win = -1
local split_dir = "j"

local function split(direction)
  local just_opened = false
  if vim.fn.winnr() == vim.fn.winnr(direction) then
    if direction == "j" or direction == "k" then
      vim.cmd("split")
    else
      vim.cmd("vsplit")
    end
    just_opened = true
  end

  vim.cmd(string.format("wincmd %s", direction))

  if just_opened then
    if last_buf > 0 then
      vim.cmd(string.format("b %s", last_buf))
    end
    last_buf = vim.api.nvim_get_current_buf()
    split_dir = direction
    last_win = vim.api.nvim_get_current_win()
  end

  if vim.bo.buftype == "terminal" then
    vim.cmd("startinsert")
  end
end

local function close(wins)
  for _, win in ipairs(wins) do
    local win_number = vim.api.nvim_win_get_number(win)
    local buf = vim.api.nvim_win_get_buf(win)
    if win_number ~= 1 then
      vim.api.nvim_set_current_win(win)
      last_buf = buf
      vim.cmd("quit")
    end
  end
end

local function toggle()
  local wins = vim.api.nvim_list_wins()

  if #wins <= 1 then
    split(split_dir)
  else
    close(wins)
  end
end

vim.keymap.set("t", "<C-x>", function()
  toggle()
end)

vim.keymap.set("n", "<C-x>", function()
  toggle()
end)

vim.keymap.set("n", "<C-l>", function()
  split("l")
end)

vim.keymap.set("n", "<C-h>", function()
  split("h")
end)

vim.keymap.set("n", "<C-j>", function()
  split("j")
end)

vim.keymap.set("n", "<C-k>", function()
  split("k")
end)

vim.keymap.set("t", "<C-l>", function()
  vim.cmd("wincmd l")
end)

vim.keymap.set("t", "<C-h>", function()
  vim.cmd("wincmd h")
end)

vim.keymap.set("t", "<C-j>", function()
  vim.cmd("wincmd j")
end)

vim.keymap.set("t", "<C-k>", function()
  vim.cmd("wincmd k")
end)

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

return M
