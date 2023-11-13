return {
  {
    "nvim-lualine/lualine.nvim",
    -- requires -> dependencies
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      -- opt --> lazy
      lazy = true
    },
    -- lualine configuration goes in opts
    opts = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    }
  }
}
