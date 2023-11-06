-- setup inspired by pseudometa; see:
-- https://github.com/chrisgrieser/.config/blob/main/nvim/lua/plugins/lsp-config.lua

vim.g.lsps = {
  "lua_ls", -- lua; nvim setup is in lua
  "bashls", -- bash/zsh; for basic scripts
}


-- table<string, config>
local configs = {}
for _,lsp in pairs(vim.g.lsps) do
  configs[lsp] = {}
end



-- DOCS https://luals.github.io/wiki/settings/
configs.lua_ls = {
  settings = {
    Lua = {
      completion = {
	callSnippet = "Replace",
	keywordSnippet = "Replace",
	displayContext = 6,
	showWord = "Disable",  -- don't suggest common words as fallback
	postfix = ".",         -- useful for `table.insert` and the like
      },
      diagnostics = {
	globals = { "vim" },   -- when contributing to nvim plugins missing a .luarc.json
      },
      hint = {
	enable = true,         -- enabled inlay hints
	setType = true,
	arrayIndex = "Disable",
      },
      -- FIX https://github.com/sumneko/lua-language-server/issues/679#issuecomment-925524834
      workspace = { checkThirdParty = false },
    },
  },
}

-- Do I need this? How does it work?
configs.bashls = {
}



return {
  {
    "folke/neodev.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      for lsp, config in pairs(configs) do
	require("lspconfig")[lsp].setup(config)
      end
    end
  }
}
