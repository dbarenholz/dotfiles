-- setup inspired by pseudometa; see:
-- https://github.com/chrisgrieser/.config/blob/main/nvim/lua/plugins/lsp-config.lua

vim.g.lsps = {
  "lua_ls",    -- lua; nvim setup is in lua
  -- TODO: steal chrisgrieser's way of using bashls for zsh
  "bashls",    -- bash/zsh; for basic scripts
  "marksman",  -- md; markdown completion, wiki links
  "cssls",     -- css
  "jsonls",    -- json
  --"biome",
  --"tsserver",
  --"html"
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


-- DOCS https://github.com/sublimelsp/LSP-css/blob/master/LSP-css.sublime-settings
-- DOCS https://github.com/microsoft/vscode-css-languageservice/blob/main/src/services/lintRules.ts
-- TODO: Figure out what settings I want.
configs.cssls = {
  settings = {
    css = {
      colorDecorators = { enable = true }, -- color inlay hints
      lint = {
	-- compatibleVendorPrefixes = "ignore",
	-- vendorPrefix = "ignore",
	-- unknownVendorSpecificProperties = "ignore",
	-- unknownProperties = "ignore", -- duplicate with stylelint
	-- duplicateProperties = "warning",
	-- emptyRules = "warning",
	-- importStatement = "warning",
	-- zeroUnits = "warning",
	-- fontFaceProperties = "warning",
	-- hexColorLength = "warning",
	-- argumentsInColorFunction = "warning",
	-- unknownAtRules = "warning",
	-- ieHack = "warning",
	-- propertyIgnoredDueToDisplay = "warning",
      },
    },
  },
}

-- Setup the LSPs
local function setupLspsWithCapabilities()
  -- enable snippet (nvm-cmp) and folding (nvm-ufo) support
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }
  -- set capabilities for each LSP
  for lsp, config in pairs(configs) do
    config.capabilities = capabilities
    require("lspconfig")[lsp].setup(config)
  end
end

return {
  {
    "folke/neodev.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      setupLspsWithCapabilities()
    end
  }
}
