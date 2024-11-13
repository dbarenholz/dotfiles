-- Add desired LSPs here.
-- TODO: Add desired LSPs here; see https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

--- A dictionary mapping LSP name to its desired server_configuration.
local wanted_lsps = {
  -- Lua language server
  lua_ls = {
    Lua = {
      -- Don't complain about `vim` being an unknown global
      diagnostics = { globals = { "vim" } }
    }
  },
  -- Bash language server
  bashls = {},

  -- Typescript
  ts_ls = {},

  -- Haskell
  hls = {},

  -- java
  jdtls = {}
}

return {
  -- Mason: installing LSPs for you
  {
    "williamboman/mason.nvim",
    opts = { },
    dependencies = {
      -- Enable Mason to automatically install stuff
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = { ensure_installed = vim.tbl_keys(wanted_lsps), run_on_start = true },
      },
      -- Make Mason and lspconfig work together
      "williamboman/mason-lspconfig.nvim"
    }
  },

  -- lspconfig: automatically setup LSPs (after mason has installed them)
  {
    "neovim/nvim-lspconfig",
    config = function ()
      -- Enable completions for nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true


      -- Loop over wanted lsps, and do setup for each of them
      for lsp_name, lsp_settings in pairs(wanted_lsps) do
      -- NOTE: "setup nvim-java before lspconfig"; so don't do this here!
        if lsp_name ~= "jdtls" then
          require("lspconfig")[lsp_name].setup({
            capabilities = capabilities,
            settings = lsp_settings
          })
        end
      end
    end,
  },

  -- nvim-cmp: completion engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Make cmp work with LSPs
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        -- Use LSPs for completion
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
        }),
        -- Set up default keybinds
        mapping = cmp.mapping.preset.insert({
	  ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
        }),
      })
    end,
  },

  -- treesitter: syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = { "lua", "java" },
      auto_install = true, -- auto-install missing parsers when entering buffer
      highlight = { enable = true },
    },
  },
}
