return {
  -- Telescope itself
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
	"nvim-lua/plenary.nvim"
      }
    }
  },
  -- Telescope extension for a file browser (in stead of fuzzy finding files)
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
      }
    }
  }
}
