---Let neovim warn me if I set duplicate keymaps.
---This is copied from pseudometa's dotfiles: https://github.com/chrisgrieser/.config/blob/main/nvim/lua/config/leader-keybindings.lua
---@param modes string|string[]
---@param lhs string
---@param rhs string|function
---@param opts? { unique: boolean, desc: string, buffer: boolean|number, nowait: boolean, remap: boolean }
function Keymap(modes, lhs, rhs, opts)
	if not opts then opts = {} end
	if opts.unique == nil then opts.unique = true end
	vim.keymap.set(modes, lhs, rhs, opts)
end


-- usually, I do not want to remap things
local noremap = { remap = false }

-- Set <Space> as leader
Keymap('n', " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "

-- Diagnostics & LSP
Keymap('n', '<leader>e', vim.diagnostic.open_float)  -- e  :: error
Keymap('n', '<leader>pd', vim.diagnostic.goto_prev)  -- pd :: prev diagnostic
Keymap('n', '<leader>nd', vim.diagnostic.goto_next)  -- nd :: next diagnostic
Keymap('n', '<leader>ld', vim.diagnostic.setloclist) -- ld :: list diagnostics

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, remap = false }

    -- DOCS https://neovim.io/doc/user/lsp.html#vim.lsp.buf.definition()
    Keymap('n', 'gd', vim.lsp.buf.definition, opts)       -- gd :: goto def
    -- DOCS https://neovim.io/doc/user/lsp.html#vim.lsp.buf.type_definition()
    Keymap('n', 'gt', vim.lsp.buf.type_definition, opts)  -- gt :: goto type
    -- DOCS https://neovim.io/doc/user/lsp.html#vim.lsp.buf.implementation()
    Keymap('n', 'gi', vim.lsp.buf.implementation, opts)   -- gi :: goto impl
    -- DOCS https://neovim.io/doc/user/lsp.html#vim.lsp.buf.hover()
    Keymap('n', 'K',  vim.lsp.buf.hover, opts)            -- K :: no logical reason..
  end,
})

-- Telescope: file and project navigation
Keymap('n', '<leader>ff', ':Telescope find_files<CR>', noremap)  -- ff :: find files
Keymap('n', '<leader>fg', ':Telescope live_grep<CR>',  noremap)  -- fg :: find (by using) grep
Keymap('n', '<leader>fb', ':Telescope buffers<CR>',    noremap)  -- fb :: find buffers
