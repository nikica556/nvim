vim.filetype.add({
  extension = {
    impex = "impex",
    metal = "metal",
    ll = "llvm",
  },
  filename = {
    [".impex"] = "impex",
  },
})
vim.treesitter.language.register("cpp", "metal")
