# nvim

Neovim (nvim) is a terminal-based editor.
I have used [this](<https://nanotipsforvim.prose.sh/bare-bones-modern-nvim-config>) blogpost to get a very minimal setup, on which I slowly iterate.
I encourage you to read the linked blogpost.
The plugin manager used is [`lazy.nvim`](<https://lazy.folke.io>).

## Modifications

1. **Modularize plugins**: In stead of `local myPlugins = { ... }` and `require("lazy").setup({ spec = myPlugins })`, I have a folder `.config/nvim/lua/plugins` in which any `*.lua` file will automatically be loaded by `lazy.nvim` using `require("lazy").setup("plugins")`. This is done [according to the docs](<https://lazy.folke.io/usage/structuring>).
2. **Options**: Under `.config/nvim/lua/config` in `options.lua` I set various options. The file is commented.
3. **Autocmds**: Under `.config/nvim/lua/config` in `autocmds.lua` I ensure I don't have whitespace at the end of lines. The file is commented.
4. **keybinds**: Under `.config/nvim/lua/config` in `keybinds.lua` I set my own desired keybinds. The file is commented.
5. **Functions**:  Under `.config/nvim/lua/config` in `functions.lua` I write functions I need elsewhere (e.g. in the script to generate the list of plugins below). The file is commented.

## Installed plugins

- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim.git)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp.git)
- [lazy.nvim](https://github.com/folke/lazy.nvim.git)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim.git)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim.git)
- [mason.nvim](https://github.com/williamboman/mason.nvim.git)
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim.git)
- [mini.align](https://github.com/echasnovski/mini.align.git)
- [mini.icons](https://github.com/echasnovski/mini.icons.git)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp.git)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig.git)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons.git)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim.git)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim.git)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim.git)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim.git)
- [ts-comments.nvim](https://github.com/folke/ts-comments.nvim.git)
- [which-key.nvim](https://github.com/folke/which-key.nvim.git)
