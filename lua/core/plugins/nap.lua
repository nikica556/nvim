local M = {}

local function get_dir_path()
  local cur_buf_path = vim.api.nvim_buf_get_name(0)
  return cur_buf_path ~= "" and vim.fn.fnamemodify(cur_buf_path, ":p:h") or vim.fn.getcwd()
end

local get_fs = function(dir_path)
  -- Compute sorted array of all files in target directory
  local dir_handle = vim.loop.fs_scandir(dir_path)
  if dir_handle == nil then
    return
  end
  return function()
    return vim.loop.fs_scandir_next(dir_handle)
  end
end

local get_subdir = function(dir_path)
  local files_stream = get_fs(dir_path)
  for basename, fs_type in files_stream do
    if fs_type == "directory" then
      return basename
    end
  end
end

local get_files = function(dir_path)
  -- Compute sorted array of all files in target directory
  local dir_handle = vim.loop.fs_scandir(dir_path)
  if dir_handle == nil then
    return
  end
  local files_stream = function()
    return vim.loop.fs_scandir_next(dir_handle)
  end

  local files = {}
  for basename, fs_type in files_stream do
    print(fs_type)
    if fs_type == "file" then
      table.insert(files, basename)
    end
  end

  -- - Sort files ignoring case
  table.sort(files, function(x, y)
    return x:lower() < y:lower()
  end)

  return files
end

local cur_file_index = function(files)
  local cur_basename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
  local cur_basename_ind
  if cur_basename ~= "" then
    for i, f in ipairs(files) do
      if cur_basename == f then
        cur_basename_ind = i
        break
      end
    end
  end
  return cur_basename_ind
end

vim.keymap.set("n", "<C-n>", function()
  if vim.api.nvim_win_get_config(0).relative ~= "" then
    return
  end
  local dir_path = get_dir_path()
  local files = get_files(dir_path)
  if files == nil then
    return
  end
  local index = cur_file_index(files) or 0
  if index + 1 <= #files then
    local path_sep = package.config:sub(1, 1)
    local target_path = dir_path .. path_sep .. files[index + 1]
    vim.cmd("edit " .. target_path)
  end
end, { desc = "Prev File" })

vim.keymap.set("n", "<C-p>", function()
  if vim.api.nvim_win_get_config(0).relative ~= "" then
    return
  end
  local dir_path = get_dir_path()
  local files = get_files(dir_path)
  if files == nil then
    return
  end
  local index = cur_file_index(files) or #files + 1
  if index > 1 then
    local path_sep = package.config:sub(1, 1)
    local target_path = dir_path .. path_sep .. files[index - 1]
    vim.cmd("edit " .. target_path)
  end
end, { desc = "Next File" })

vim.keymap.set("n", "-", function()
  local cur_path = get_dir_path()
  local parent_path = vim.fn.fnamemodify(cur_path, ":h")
  local files = get_files(parent_path)
  if files == nil or #files == 0 then
    return
  end
  local path_sep = package.config:sub(1, 1)
  local target_path = parent_path .. path_sep .. files[1]
  vim.cmd("edit " .. target_path)
end, { desc = "Parent File" })

vim.keymap.set("n", "+", function()
  local cur_path = get_dir_path()
  local sub_dir = get_subdir(cur_path)
  if sub_dir == nil then
    return
  end
  local child_path = cur_path .. "/" .. sub_dir
  local files = get_files(child_path)
  if files == nil or #files == 0 then
    return
  end
  local path_sep = package.config:sub(1, 1)
  local target_path = child_path .. path_sep .. files[1]
  vim.cmd("edit " .. target_path)
end, { desc = "Child File" })

return M
