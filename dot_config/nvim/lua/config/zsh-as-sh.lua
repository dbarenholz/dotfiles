-- Tell treesitter to use bashls for zsh files
-- https://nanotipsforvim.prose.sh/treesitter-and-lsp-support-for-zsh
vim.filetype.add {
  extension = {
    zsh = "sh",
    sh = "sh"
  },
  filename = {
    [".zshrc"] = "sh",
    [".zshenv"] = "sh"
  }
}
