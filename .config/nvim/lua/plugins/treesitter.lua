-- Configuration for treesitter
local config = {
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUPdate",
    main = "nvim-treesitter.configs",
    opts = config
  },
}
