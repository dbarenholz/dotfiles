# nvim

Neovim (nvim) is a terminal-baesd editor.

TODO: Notes about setup.

## Language Servers

The way to add new language servers is split into two items:

### Install the language server on the machine

Because I'm on an immutable OS, this is different from usual.

1. Enter `dev` distrobox.
2. Install the language server on the system.
     ex: `sudo pacman -S lua-language-server`
3. Export the binary.
     ex: `distrobox-export --bin /usr/sbin/lua-language-server`


### Tell neovim to use the language server

1. Open `https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md`
2. Open `~/.config/nvim/lua/plugins/lsp-config.lua`.
3. In the table starting at line 3: add the name of LSP (note the comma)
     ex: `"  lua_ls",`
4. Add the language server configuration blob. (Try to link to docs too)
     ex: `configs.lua_ls = { ... }`

That _should_ be all for language servers.
