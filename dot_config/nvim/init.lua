-- Bootstrap lazy.nvim
-- See: https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Import my own configuration (keybinds, autocmds, options, ...)
require("config.options")
require("config.autocmds")
require("config.keybinds")
require("config.functions")

-- Tell Lazy to load the plugins from each `.config/nvim/lua/plugins/*.lua`
require("lazy").setup({
  spec    = { { import = "plugins" } },
  install = { colorscheme = {"tokyonight.nvim"} },
})

-- Some plugins only get configured above, but not _started_.
require("lualine").setup()
require("bufferline").setup()
require("mini.align").setup()
require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return 80
    end
  end,
  open_mapping = [[<leader><CR>]],
  insert_mappings = false,
  direction = "vertical"
})

-- NOTE: setup nvim-java before lspconfig
require('java').setup()
require('lspconfig').jdtls.setup({})


-- Use bashls for zsh files
require("config.zsh-as-sh")

-- Set color scheme
vim.cmd[[colorscheme tokyonight-night]]
