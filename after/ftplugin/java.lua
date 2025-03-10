local gotoDef = function()
  local dir_path = "~/goHy2/core-customize/hybris/bin/custom/gorenje/ggfacades/src/si/zenlab/gg/facades/impl"
  local word = vim.fn.expand("<cword>")

  local cursor_pos = vim.api.nvim_win_get_cursor(0) -- Get cursor position (row, col)
  local row, col = cursor_pos[1], cursor_pos[2]
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]
  local start_col = math.max(0, col - 20)
  local substring = line:sub(start_col + 1, col + 1) -- Lua uses 1-based indexing
  local fullstring = substring .. word

  if string.find(fullstring, "WsDTO") then
    dir_path =
      "~/goHy2/core-customize/hybris/bin/custom/ggcommercewebservices/resources ~/goHy2/core-customize/hybris/bin/custom/ggcommercewebservices/web/webroot/WEB-INF/config/v2"
    print("WSDTO")
  elseif string.find(fullstring, "facade") then
    dir_path = "~/goHy2/core-customize/hybris/bin/custom/gorenje/ggfacades/src/si/zenlab/gg/facades/impl"
  elseif string.find(fullstring, "Service") then
    dir_path = "~/goHy2/core-customize/hybris/bin/custom/gorenje/ggcore/src/si/zenlab/gg/core/service/impl"
  elseif string.find(fullstring, "DAO") then
    dir_path = "~/goHy2/core-customize/hybris/bin/custom/gorenje/ggcore/src/si/zenlab/gg/core/daos/impl"
  end

  local cmd = string.format("rg -l %s %s", vim.fn.shellescape(word), dir_path)
  local result = vim.fn.systemlist(cmd)

  if #result == 0 then
    print("No occurences found")
    return
  end

  vim.cmd("edit " .. vim.fn.fnameescape(result[1]))
  if string.find(word, "WsDTO") then
    vim.fn.search("\\<" .. word .. "\\>")
  else
    vim.fn.search(" \\zs\\<" .. word .. "\\>")
  end
end

vim.keymap.set("n", "gd", function()
  gotoDef()
end, { noremap = true, silent = true })
