vim.filetype.add({
  extension = {
    impex = "impex",
  },
  filename = {
    [".impex"] = "impex",
  },
  pattern = {
    [".*%.component%.html"] = "htmlangular",
  },
})
