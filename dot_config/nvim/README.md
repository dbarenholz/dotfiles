## nvim

- [ ] Add some links when this is on git

[`nvim`](#) is a terminal-based editor. I use it to edit text and code files.
To get started, I used [pseudometa's blogpost](<https://nanotipsforvim.prose.sh/bare-bones-modern-nvim-config>) for a minimal setup. Then, I modified it according to my tastes.
I used [`lazy.nvim`](<https://lazy.folke.io>) as plugin manager.

### Modifications

- [ ] write some more about the actual configuration

1. **Modularize plugins**: In stead of `local myPlugins = { ... }` and `require("lazy").setup({ spec = myPlugins })`, I have a folder `.config/nvim/lua/plugins` in which any `*.lua` file will automatically be loaded by `lazy.nvim` using `require("lazy").setup("plugins")`. This is done [according to the docs](<https://lazy.folke.io/usage/structuring>).
2. **Options**: Under `.config/nvim/lua/config` in `options.lua` I set various options. The file is commented.
3. **Autocmds**: Under `.config/nvim/lua/config` in `autocmds.lua` I ensure I don't have whitespace at the end of lines. The file is commented.
4. **keybinds**: Under `.config/nvim/lua/config` in `keybinds.lua` I set my own desired keybinds. The file is commented.
5. **Functions**:  Under `.config/nvim/lua/config` in `functions.lua` I write functions I need elsewhere (e.g. in the script to generate the list of plugins below). The file is commented.

### Installed plugins

- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim.git)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp.git)
- [lazy.nvim](https://github.com/folke/lazy.nvim.git)
- [lua-async-await](https://github.com/nvim-java/lua-async-await.git)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim.git)
- [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim.git)
- [mason.nvim](https://github.com/williamboman/mason.nvim.git)
- [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim.git)
- [mini.align](https://github.com/echasnovski/mini.align.git)
- [mini.icons](https://github.com/echasnovski/mini.icons.git)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim.git)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp.git)
- [nvim-dap](https://github.com/mfussenegger/nvim-dap.git)
- [nvim-java-core](https://github.com/nvim-java/nvim-java-core.git)
- [nvim-java-dap](https://github.com/nvim-java/nvim-java-dap.git)
- [nvim-java](https://github.com/nvim-java/nvim-java.git)
- [nvim-java-refactor](https://github.com/nvim-java/nvim-java-refactor.git)
- [nvim-java-test](https://github.com/nvim-java/nvim-java-test.git)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig.git)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter.git)
- [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo.git)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons.git)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim.git)
- [promise-async](https://github.com/kevinhwang91/promise-async.git)
- [spring-boot.nvim](https://github.com/JavaHello/spring-boot.nvim.git)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim.git)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim.git)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim.git)
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim.git)
- [ts-comments.nvim](https://github.com/folke/ts-comments.nvim.git)
- [which-key.nvim](https://github.com/folke/which-key.nvim.git)
